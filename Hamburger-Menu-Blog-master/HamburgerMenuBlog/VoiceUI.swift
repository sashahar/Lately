//
//  VoiceUI.swift
//  HamburgerMenuBlog
//
//  Created by Caroline Braviak on 11/30/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit
import Speech
import AVFoundation

class VoiceUI: UIViewController, SFSpeechRecognizerDelegate {

    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var inputText: UILabel!
    @IBOutlet weak var userRequest: UITextView!
    @IBOutlet weak var microphoneButton: UIButton!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    
    var textToDisplay: String!
    var UI: VoiceFlow!
    var callback : ((Bool) -> Void)?
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "en-US"))!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    private let speechSynthesizer = AVSpeechSynthesizer()
    
    private var itter: Int = 0
    private var imageIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itter = 0
        inputText.text = UI.suggestions[itter]
        headerText.text = UI.prompts[itter]
        displayImage.layer.cornerRadius = 15
        displayImage.layer.masksToBounds = true
        if(UI.flowNeedsImage[itter]){
            displayImage.image = UI.images[imageIndex]
            imageIndex = imageIndex + 1
        }

        
        microphoneButton.layer.cornerRadius = 15
        microphoneButton.layer.masksToBounds = true
        microphoneButton.isEnabled = false
        microphoneButton.setTitle("Start Speaking", for: .normal)
        
        speechRecognizer.delegate = self
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            var isButtonEnabled = false
            
            switch authStatus {
            case .authorized:
                isButtonEnabled = true
                
            case .denied:
                isButtonEnabled = false
                print("User denied access to speech recognition")
                
            case .restricted:
                isButtonEnabled = false
                print("Speech recognition restricted on this device")
                
            case .notDetermined:
                isButtonEnabled = false
                print("Speech recognition not yet authorized")
            }
            
            OperationQueue.main.addOperation() {
                self.microphoneButton.isEnabled = isButtonEnabled
            }
        }
        speak(itter: itter)

    }
    
    @IBAction func exitClicked(_ sender: Any){
        if(UI.objectID == 1){
            print(itter)
            if(itter >= 2){ //if the iteration is greater than or equal to 2 when exiting it means that a reminder for lunch with sasha has been set
                callback?(true)
            }else{
                callback?(false)
            }
        }
        
        if(!speechSynthesizer.isSpeaking){
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func microphoneTapped(_ sender: Any) {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            if(self.userRequest.text.caseInsensitiveCompare("go home") == .orderedSame){
                exitClicked(self)
            }
            microphoneButton.isEnabled = false
            microphoneButton.setTitle("Start Speaking", for: .normal)
            itter = itter + 1
            if(itter < UI.numFlows){
                inputText.text = UI.suggestions[itter]
                headerText.text = UI.prompts[itter]
                if(UI.flowNeedsImage[itter]){
                    displayImage.image = UI.images[imageIndex]
                    imageIndex = imageIndex + 1
                }else{
                    displayImage.image = nil;
                }
                speak(itter: itter)
            }
        } else {
            if(!speechSynthesizer.isSpeaking){
                startRecording()
                microphoneButton.setTitle("Stop Speaking", for: .normal)
            }

        }
    }
    
    func speak(itter: Int){
        if(!microphoneButton.isEnabled){
            let utterance = AVSpeechUtterance(string: UI.prompts[itter])
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechSynthesizer.speak(utterance)
            let utterance2 = AVSpeechUtterance(string: UI.suggestions[itter])
            speechSynthesizer.speak(utterance2)
        }
    }
    
    func startRecording() {
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .default)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            
            var isFinal = false
            
            if result != nil {
                
                self.userRequest.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.microphoneButton.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            microphoneButton.isEnabled = true
        } else {
            microphoneButton.isEnabled = false
        }
    }
}
