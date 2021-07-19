//
//  Profile.swift
//  DiffTest
//
//  Created by YJ on 2021/07/19.

import Foundation

struct Profile: Hashable {
    let id: Int
    let imageUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(imageUrl)
    }
}


final class Model {
    static private var simple: [Profile] = [
        Profile(id: 1, imageUrl: "https://en.meming.world/images/en/8/8e/Cursed_Cat_meme_1.jpg"),
        Profile(id: 2, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUrWskbZvU1Pk0Hz92s7zYRdzQ8GaEajPNDutgEVtqJdXSA4loLmxs3APy32EUlISxSEI&usqp=CAU"),
        Profile(id: 3, imageUrl: "https://i.kym-cdn.com/photos/images/facebook/001/147/288/1ec.png")
    ]
    
    static private var complex: [Profile] = [
        Profile(id: 1, imageUrl: "https://en.meming.world/images/en/8/8e/Cursed_Cat_meme_1.jpg"),
        Profile(id: 2, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUrWskbZvU1Pk0Hz92s7zYRdzQ8GaEajPNDutgEVtqJdXSA4loLmxs3APy32EUlISxSEI&usqp=CAU"),
        Profile(id: 3, imageUrl: "https://i.kym-cdn.com/photos/images/facebook/001/147/288/1ec.png"),
        Profile(id: 4, imageUrl: "https://i0.wp.com/petpersonalities.com/wp-content/uploads/2016/04/cat-charged-green-light-eyes-memes.jpg?fit=420%2C420"),
        Profile(id: 5, imageUrl: "https://w7.pngwing.com/pngs/185/396/png-transparent-pepe-the-frog-united-states-internet-meme-frowny-frog-s-leaf-vertebrate-grass.png"),
        Profile(id: 6, imageUrl: "https://img.thedailybeast.com/image/upload/v1531451526/180712-Weill--The-Creator-of-Pepe-hero_uionjj.jpg"),
        Profile(id: 7, imageUrl: "https://jejuhydrofarms.com/wp-content/uploads/2020/05/blank-profile-picture-973460_1280.png"),
        Profile(id: 8, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEKWsrQjrLklNeCqRe4FXVCTLKzyQaXWqwWUDyFvq8e1YXaPFu-thyqOzkiwXLshME9H0&usqp=CAU"),
        Profile(id: 9, imageUrl: "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_1280.png"),
        Profile(id: 10, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE9tG_NFfmLde3aA3q3p2yib1KJslRRNlJQg&usqp=CAU"),
        Profile(id: 11, imageUrl: "https://t3.ftcdn.net/jpg/03/91/19/22/360_F_391192211_2w5pQpFV1aozYQhcIw3FqA35vuTxJKrB.jpg"),
        Profile(id: 12, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQybfZDCOylNw3wPpQ9r0F9khF0mXeRcSzx5A&usqp=CAU"),
        Profile(id: 13, imageUrl: "https://image.shutterstock.com/image-vector/no-user-profile-picture-hand-260nw-99335579.jpg"),
        Profile(id: 14, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQrj_CSKNRaDp5zdhXNkp2gWRgkfx5y4LTzvGaQn0ZlgtNa9Ri2RtAm2X-G3D4cdU-MSY&usqp=CAU"),
        Profile(id: 15, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq2As40rUMkA3vXS4ILmOfqSIGGFtlChwjA2X6wRZBL0cLzldyFSRoFyYQlD-8DavmEvM&usqp=CAU"),
        Profile(id: 16, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7S91Ra4RZewtTBAgd1wHIiaWHk-Z7U4QyEg&usqp=CAU"),
        Profile(id: 17, imageUrl: "https://cdn2.vectorstock.com/i/1000x1000/67/16/profile-placeholder-image-gray-silhouette-no-vector-30216716.jpg"),
        Profile(id: 18, imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnm_wAWRVDyq29N7tcr3FNmh2SF3yO4CZDM25oRISbJMuvR0eib4kIqMSmrYZ3OTZsZAE&usqp=CAU"),
        Profile(id: 19, imageUrl: "https://img.freepik.com/free-photo/unknown-male-silhouette-person_68747-222.jpg?size=338&ext=jpg"),
    ]
    
    static func getSimpleModel() -> [Profile] {
        let randomInt = Int.random(in: 1 ... 3)
        return Array(simple.shuffled().prefix(randomInt))
    }
    
    static func getComplexModel() -> [Profile] {
        let randomInt = Int.random(in: 1 ... 19)
        return Array(complex.shuffled().prefix(randomInt))
    }
}
