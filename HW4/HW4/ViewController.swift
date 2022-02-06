//
//  ViewController.swift
//  HW4
//
//  Created by Mauro Mujica-Parodi on 2/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var powerStatus: UILabel!
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var channelValue: UILabel!
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    var tmpChannel: String?
    @IBOutlet weak var favoriteChannelSegmentControl: UISegmentedControl!
    @IBOutlet weak var channelStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        powerStatus.text = (powerSwitch.isOn ? "on" : "off")
        volumeValue.text = "\(Int(volumeSlider.value))"
        channelStepper.value = 1
        channelValue.text = "1"
    }

    @IBAction func togglePower(_ sender: UISwitch) {
        powerStatus.text = (sender.isOn ? "on": "off")
        sender.isOn ? {
            volumeSlider.isEnabled = false
            
        }
        
    }
    
    @IBAction func volumeChange(_ sender: UISlider) {
        volumeValue.text = "\(Int(sender.value))"
    }
    
    @IBAction func incrementChannel(_ sender: UIButton) {
        if sender.currentTitle == "Ch +" {
            channelStepper.value = channelStepper.value + 1
        } else if sender.currentTitle == "Ch -" {
            channelStepper.value = channelStepper.value - 1
        }
        channelValue.text = "\(Int(channelStepper.value))"
        favoriteChannelSegmentControl.selectedSegmentIndex = -1
    }
    @IBAction func channelSelection(_ sender: UIButton) {
        if tmpChannel != nil {
            tmpChannel = tmpChannel! + sender.currentTitle!
            channelValue.text = tmpChannel
            channelStepper.value = Double(Int(tmpChannel!)!)
            tmpChannel = nil
        } else {
            if let a = sender.currentTitle {
                tmpChannel = a
                channelValue.text = tmpChannel
            }
        }
        favoriteChannelSegmentControl.selectedSegmentIndex = -1
    }
    @IBAction func favoriteChannelSelection(_ sender: UISegmentedControl) {
        if let channel = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            switch channel {
            case "ABC":
                channelStepper.value = 7
                channelValue.text = "7"
            case "NBC":
                channelStepper.value = 4
                channelValue.text = "4"
            case "CBS":
                channelStepper.value = 9
                channelValue.text = "9"
            case "FOX":
                channelStepper.value = 5
                channelValue.text = "5"
            default:
                sender.selectedSegmentIndex = -1
            }
            
        }
    }
}

