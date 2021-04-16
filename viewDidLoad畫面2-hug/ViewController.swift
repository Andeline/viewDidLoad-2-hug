//
//  ViewController.swift
//  viewDidLoad畫面2-hug
//
//  Created by 蔡佳穎 on 2021/4/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let player = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //【背景】
        view.backgroundColor = UIColor.black

        //【Gif動圖】
        let hugImageView = UIImageView(frame: CGRect(x: (view.bounds.width-185) / 2 , y: (view.bounds.height-150) / 2, width: 185, height: 150))
        view.addSubview(hugImageView)
        
        hugImageView.transform = CGAffineTransform.identity.scaledBy(x: 1.6, y: 1.6)
        let animatedImage = UIImage.animatedImageNamed("f274a5482b16425982df344a96a3a4aamvGFDrVKlZ2k74lL-", duration: 3)
        hugImageView.image = animatedImage
        
        
        //【玫瑰粒子效果】
        //CAEmitterLayer發射的粒子其實是CAEmitterCell，因此需要產生CAEmitterCell物件
        let roseEmitterCell = CAEmitterCell()
        let pinkRoseEmitterCell = CAEmitterCell()
        let leafEmitterCell = CAEmitterCell()
        
        //設定粒子顯示圖片
        roseEmitterCell.contents = UIImage(named: "rose.png")?.cgImage
        pinkRoseEmitterCell.contents = UIImage(named: "pinkRose.png")?.cgImage
        leafEmitterCell.contents = UIImage(named: "葉.png")?.cgImage
        
        //設定大小
        roseEmitterCell.scale = 0.01
        pinkRoseEmitterCell.scale = 0.01
        leafEmitterCell.scale = 0.009

        //設定粒子大小的範圍
        roseEmitterCell.scaleRange = 0.12
        pinkRoseEmitterCell.scaleRange = 0.1
        leafEmitterCell.scaleRange = 0.1
        
        //設定粒子往上飄時越來越小，>0越來越大
        roseEmitterCell.scaleSpeed = -0.001
        pinkRoseEmitterCell.scaleSpeed = -0.001
        leafEmitterCell.scaleSpeed = -0.001

        //設定往上飄的加速度，<0方向往上
        roseEmitterCell.yAcceleration = -26
        pinkRoseEmitterCell.yAcceleration = -23
        leafEmitterCell.yAcceleration = -30
        
        //設定粒子移動速度
        roseEmitterCell.velocity = 15
        pinkRoseEmitterCell.velocity = 12
        leafEmitterCell.velocity = 18
        
        //設定每秒發射幾個粒子
        roseEmitterCell.birthRate = 1.8
        pinkRoseEmitterCell.birthRate = 1.3
        leafEmitterCell.birthRate = 2

        //設定粒子維持秒數
        roseEmitterCell.lifetime = 30
        pinkRoseEmitterCell.lifetime = 30
        leafEmitterCell.lifetime = 30
        
        //設定轉速
        roseEmitterCell.spin = 1
        pinkRoseEmitterCell.spin = 0.5
        leafEmitterCell.spin = 1.2
        
        //設定轉速範圍
        roseEmitterCell.spinRange = 1
        pinkRoseEmitterCell.spinRange = 1
        leafEmitterCell.spinRange = 1

        //粒子發射的角度範圍
        roseEmitterCell.emissionRange = CGFloat.pi
        pinkRoseEmitterCell.emissionRange = CGFloat.pi
        leafEmitterCell.emissionRange = CGFloat.pi

        //產生CAEmitterLayer，將他的emitterCells指定為剛剛產生的cell
        let roseEmitterLayer = CAEmitterLayer()
        let pinkRoseEmitterLayer = CAEmitterLayer()
        let leafEmitterLayer = CAEmitterLayer()
        roseEmitterLayer.emitterCells = [roseEmitterCell]
        pinkRoseEmitterLayer.emitterCells = [pinkRoseEmitterCell]
        leafEmitterLayer.emitterCells = [leafEmitterCell]
        
        //設定粒子發射路徑
        roseEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height + 60)
        pinkRoseEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height + 60)
        leafEmitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: view.bounds.height + 60)
        roseEmitterLayer.emitterSize = CGSize(width: view.bounds.width / 2, height: 0)
        pinkRoseEmitterLayer.emitterSize = CGSize(width: view.bounds.width / 2, height: 0)
        leafEmitterLayer.emitterSize = CGSize(width: view.bounds.width / 2, height: 0)
        roseEmitterLayer.emitterShape = .line
        pinkRoseEmitterLayer.emitterShape = .line
        leafEmitterLayer.emitterShape = .line

        //加入view
        view.layer.addSublayer(roseEmitterLayer)
        view.layer.addSublayer(pinkRoseEmitterLayer)
        view.layer.addSublayer(leafEmitterLayer)


        //【背景音樂】
        let fileUrl = Bundle.main.url(forResource: "Unchained Melody", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        
    }


}

