//
//  Model.swift
//  AppleGallery
//
//  Created by Илья on 05.10.2022.
//

import Foundation
import UIKit

struct Sections {
    let title: String
    let settings: [SettingsCellsType]
}

enum SettingsCellsType {
    case photoCell(model: SettingsPhotohCell)
    case circlePotoCell(model: SettingsCirclePhotoCell)
    case fourPhotoCell(model: SettingsFourPhotoCell)
    case menu(model: [ListFolders])
}

struct SettingsPhotohCell {
    let name: String
    let photo: UIImage?
    var number: Int
}

struct SettingsCirclePhotoCell {
    let name: String
    let icon: UIImage?
    let bottomLabel: String?
    let rightFoto: UIImage?
}

struct SettingsFourPhotoCell {
    let name: String
    let bottomLabel: String?
    let image: UIImage?
    let topLeftPhoto: UIImage?
    let topRightPhoto: UIImage?
    let bottomRigthPhoto: UIImage?
    let bootomLeftPhoto: UIImage?
}

struct ListFolders {
    var image: UIImage?
    var name: String
    var numbers: String
}

extension Sections {
    static func getSections() -> [Sections] {
        return [
            Sections(title: "", settings: [
                .photoCell(model: SettingsPhotohCell(name: "Недавние", photo: UIImage(named: "favorite"), number: 3466)),
                .photoCell(model: SettingsPhotohCell(name: "Избранное", photo: UIImage(named: "bin"), number: 456)),
                .photoCell(model: SettingsPhotohCell(name: "WhatsApp", photo: UIImage(named: "whatsapp"), number: 1289)),
                .photoCell(model: SettingsPhotohCell(name: "Instagram", photo: UIImage(named: "inst"), number: 56)),
                .photoCell(model: SettingsPhotohCell(name: "Viber", photo: UIImage(named: "viber"), number: 12)),
                .photoCell(model: SettingsPhotohCell(name: "Делимобиль", photo: UIImage(named: "delimobil"), number: 36)),
                .photoCell(model: SettingsPhotohCell(name: "Belka Car", photo: UIImage(named: "belka"), number: 109)),
                .photoCell(model: SettingsPhotohCell(name: "VK", photo: UIImage(named: "vk"), number: 1))
            ]),
            
            Sections(title: "", settings: [
                .circlePotoCell(model: SettingsCirclePhotoCell(name: "ОАЭ 2021", icon: UIImage(named: "oae"), bottomLabel: "От: Друзей", rightFoto: UIImage(named: "two"))),
                .circlePotoCell(model: SettingsCirclePhotoCell(name: "Турция 2022", icon: UIImage(named: "turkey"), bottomLabel: "От: Подруг", rightFoto: UIImage(named: "one"))),
                .circlePotoCell(model: SettingsCirclePhotoCell(name: "Сербия 2020", icon: UIImage(named: "belgrad"), bottomLabel: "От: Дима", rightFoto: UIImage(named: "vk"))),
                .circlePotoCell(model: SettingsCirclePhotoCell(name: "Испания", icon: UIImage(named: "spain"), bottomLabel: "От: Оля", rightFoto: UIImage(named: "three")))
            ]),
            
            Sections(title: "", settings: [
                .fourPhotoCell(model: SettingsFourPhotoCell(name: "Люди", bottomLabel: "12", image: UIImage(named: "black"), topLeftPhoto: UIImage(named: "one"), topRightPhoto: UIImage(named: "two"), bottomRigthPhoto: UIImage(named: "three"), bootomLeftPhoto: UIImage(named: "oae"))),
                .photoCell(model: SettingsPhotohCell(name: "Места", photo: UIImage(named: "map"), number: 1200))
            ]),
            
            Sections(title: "", settings: [
                .menu(model: [
                    ListFolders(image: UIImage(systemName: "video"), name: "Видео", numbers: "235"),
                    ListFolders(image: UIImage(systemName: "person.crop.square"), name: "Селфи", numbers: "145"),
                    ListFolders(image: UIImage(systemName: "livephoto"), name: "Фото Live Photos", numbers: "78"),
                    ListFolders(image: UIImage(systemName: "camera.metering.center.weighted"), name: "Портреты", numbers: "45"),
                    ListFolders(image: UIImage(systemName: "timelapse"), name: "Таймлапс", numbers: "23"),
                    ListFolders(image: UIImage(systemName: "slowmo"), name: "Замедленно", numbers: "5"),
                    ListFolders(image: UIImage(systemName: "photo.on.rectangle"), name: "Снимки экрана", numbers: "170"),
                    ListFolders(image: UIImage(systemName: "record.circle"), name: "Записи экрана", numbers: "57"),
                    ListFolders(image: UIImage(systemName: "rhombus"), name: "Анимированные", numbers: "19"),
                    ListFolders(image: UIImage(systemName: "trash"), name: "Недавно удаленные", numbers: "340")
                ])
            ])
        ]
    }
}
