//
//  MovieInteractor.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation
import Alamofire

class MovieDetailInteractor: PresenterToInteractorMovieDetailProtocol {
    
    var presenter: InteractorToPresenterMovieDetailProtocol?
    
    func fetchMovieDetail(movieId: Int) {
        AF.request(MovieThemeService.getURL(param: .getMovieDetail(movieId)), headers: MovieThemeService.header).responseJSON { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let data):
                guard let json = try? JSONSerialization.data(withJSONObject: data) else { return }
                guard let result = try? JSONDecoder().decode(MovieDetailModel.self, from: json) else { return }
                self.presenter?.movieDetailFetchSuccess(movieData: result)
            case .failure(let error):
                print(error)
            }
        }
    }
}



//{
//  "id": 447365,
//  "results": [
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Vudu Extended Preview",
//      "key": "W_kdYrO_Ego",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Clip",
//      "official": false,
//      "published_at": "2023-07-07T16:00:32.000Z",
//      "id": "64a84f053e2ec800cbcc8cd3"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Guardians of the Galaxy Vol. 3 - Exclusive Deleted Scene (2023) Bradley Cooper, Chukwudi Iwuji",
//      "key": "sUiZFT-tSMM",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Behind the Scenes",
//      "official": false,
//      "published_at": "2023-07-06T14:00:36.000Z",
//      "id": "64a6cc2e724de100e220d4fe"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Bringing Adam Warlock & The High Evolutionary to the MCU",
//      "key": "68XY_8uBfCE",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Behind the Scenes",
//      "official": true,
//      "published_at": "2023-05-27T16:00:05.000Z",
//      "id": "64768f3689d97f00f8fd8b62"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Animating Rocket & Groot",
//      "key": "Upn5soqa8M8",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Behind the Scenes",
//      "official": true,
//      "published_at": "2023-05-20T17:00:28.000Z",
//      "id": "6472bc8495665800debac09a"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Bradley Cooper on Rocket: \"I love him so much\"",
//      "key": "tfrGciwxyXQ",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-16T17:00:25.000Z",
//      "id": "646681e033a37600e6796a2d"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "#1 2 Weeks",
//      "key": "7QGWXXm-Ph8",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-05-13T16:00:05.000Z",
//      "id": "6466a397d185720161906e8f"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "#1 Movie in the Galaxy",
//      "key": "c8cZzltEH2Q",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-05-08T18:22:24.000Z",
//      "id": "645c26721b70ae01260e10e1"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Marvel Studios' Louis D'Esposito At The Premiere",
//      "key": "gD556QF5IU0",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-05T22:30:08.000Z",
//      "id": "645c268d0231f2011c013b05"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Unforgettable | The Cast and Creators of Marvel Studios' Guardians of the Galaxy Vol. 3",
//      "key": "UWJftHnYf7Q",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-05T20:30:01.000Z",
//      "id": "645c26a46aa8e000e4be4984"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Finding the Perfect Guardians of the Galaxy with Sarah Halley Finn",
//      "key": "uJOu3WBnrHs",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-04T22:30:08.000Z",
//      "id": "645c269b77d23b00fccc5de8"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Nathan Fillion Makes His MCU Debut In Guardians of the Galaxy Vol. 3",
//      "key": "QWdljFroAz8",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-03T14:00:28.000Z",
//      "id": "645394e6d48cee0119a12b37"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Elizabeth Debicki On Embodying Ayesha",
//      "key": "a1OnrPPhKZo",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-02T21:00:01.000Z",
//      "id": "645394dbd48cee00fcede6e4"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Cast Unboxing",
//      "key": "WuLcGj2qzJU",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-02T18:00:23.000Z",
//      "id": "6452235487a27a00e38ec437"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Don't Let the Music Stop",
//      "key": "oVZnSu0ODis",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": false,
//      "published_at": "2023-05-01T15:33:45.000Z",
//      "id": "6468011533a376013b3d8fca"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Maria Bakalova Explains Why Cosmo is a Good Dog",
//      "key": "Lp__R7KlJug",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-05-01T14:00:22.000Z",
//      "id": "645394cf87a27a015432338d"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Be Smart",
//      "key": "ygoJOwkbiAc",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-30T22:45:02.000Z",
//      "id": "64522997091e620144d6a587"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Sean Gunn On Kraglin's Transformation",
//      "key": "bcMjCEhabMU",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-30T17:00:30.000Z",
//      "id": "64539517d8f44e0db071b8aa"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Brilliant End",
//      "key": "bLvd1dZ-NtE",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-30T01:26:07.000Z",
//      "id": "645229b0c044290164ea818b"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Linda Cardellini Is Lylla The Otter",
//      "key": "jP3gZsJDZcE",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-29T16:00:34.000Z",
//      "id": "645cf94e3fe160011bedec6b"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Introducing The High Evolutionary Live from the Red Carpet",
//      "key": "RAvctf3FqkE",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T22:00:21.000Z",
//      "id": "64539520c044290122cbec77"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Pom Klementieff On The Incredible Action In Guardians of the Galaxy Vol. 3",
//      "key": "QBmz8_J_rWs",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T20:00:09.000Z",
//      "id": "64539528d48cee00e1337aa7"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Red Carpet Highlights!",
//      "key": "m23SV2zFZo8",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T18:54:25.000Z",
//      "id": "645cf7a93fe1600155735789"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Turn It Up",
//      "key": "51P5XmIC05Y",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-28T14:00:04.000Z",
//      "id": "644c7c3351a64e08fcddae1f"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Vin Diesel Reveals Groot's Secrets",
//      "key": "qdUETgckQ0M",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T04:46:40.000Z",
//      "id": "6453954833ad8f01380d7718"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Karen Gillan On Playing Nebula",
//      "key": "gs761d_ACU4",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T04:15:01.000Z",
//      "id": "64539540c044290143e3760a"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Will Poulter On Bringing Adam Warlock To Life",
//      "key": "iOcU2wWDdjw",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T04:00:19.000Z",
//      "id": "64539591d48cee00fcede750"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Kevin Feige On Guardians of the Galaxy Vol. 3 As An Epic Finale",
//      "key": "u_QmaPhp-1Y",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T03:45:02.000Z",
//      "id": "64539537d48cee0136d959ee"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Bradley Cooper On Exploring Rocket's Origins",
//      "key": "YkxzzFubeJ8",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T03:30:19.000Z",
//      "id": "645395bc33ad8f00e3c8b671"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Chris Pratt On Star-Lord's Journey",
//      "key": "ezdtJsqtjGA",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T03:21:44.000Z",
//      "id": "645395c5d48cee0153ed47b3"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Director James Gunn On The End of the Trilogy",
//      "key": "ObhP7ZD4RF0",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-28T02:46:55.000Z",
//      "id": "645395b4091e6201234fb1e7"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Good to Have Friends Clip",
//      "key": "7Pjuew5jWAQ",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Clip",
//      "official": true,
//      "published_at": "2023-04-25T22:05:16.000Z",
//      "id": "644858570e4fc804dffe8ce2"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Biggest Event of the Summer",
//      "key": "kWv0Iz27yTU",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-22T23:50:16.000Z",
//      "id": "644484afcee2f6049f36ecdb"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "“Push Down On It” Clip (Vertical Version)",
//      "key": "EZRCDkiS59c",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Clip",
//      "official": true,
//      "published_at": "2023-04-21T18:00:05.000Z",
//      "id": "6442ed4105822404e9323c3f"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "“Push Down On It” Clip",
//      "key": "6R1_7xhUPuw",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Clip",
//      "official": true,
//      "published_at": "2023-04-21T18:00:04.000Z",
//      "id": "6442eb40ad87f70497cc8164"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Hooked",
//      "key": "LVWSRYsFBrY",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-21T17:00:14.000Z",
//      "id": "6442eaec058224053d323c01"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "All The Feels",
//      "key": "8GRsCULx-3w",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-20T21:45:41.000Z",
//      "id": "6442eaa6fcec2e0439d9a8ed"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "One Last Ride",
//      "key": "SA0hWIEaGUU",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-19T16:30:04.000Z",
//      "id": "644058a3d7cd060510da8739"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "“I Miss You” Clip",
//      "key": "USJhA8XJ1h4",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Clip",
//      "official": true,
//      "published_at": "2023-04-18T21:30:05.000Z",
//      "id": "643f11956dc6c003822c22a1"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Relax",
//      "key": "mju6Xn-KH5A",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-16T16:00:36.000Z",
//      "id": "643f055960620a0494cca872"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Final Tour",
//      "key": "tbLZFwuaZT0",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-15T16:00:36.000Z",
//      "id": "643b19dd3780620510158ef8"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Greatest Hits",
//      "key": "RxRLwDldi44",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-12T16:25:00.000Z",
//      "id": "643725cf6dc6c0010088216e"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Once More With Feeling",
//      "key": "fHG2Kz40dNg",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-06T16:30:13.000Z",
//      "id": "6433bfb8391b9c0113b5a589"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Face Off",
//      "key": "6ljaQhKY-8s",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-05T07:00:03.000Z",
//      "id": "6433bf851f98d101d3701cb6"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Get Tickets Now",
//      "key": "gvDWYQhYzhY",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-04T03:22:57.000Z",
//      "id": "6433bf63ec4552009467b156"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Get Your Tickets",
//      "key": "rKo7yTLYprw",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Featurette",
//      "official": true,
//      "published_at": "2023-04-03T19:00:29.000Z",
//      "id": "6439f7da091e6202eb5dd7cf"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Tickets on Sale Now",
//      "key": "58Ofg9IHRN0",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-03T18:05:25.000Z",
//      "id": "6433bf426dea3a00d4384b43"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Tickets On Sale Now",
//      "key": "LfaG3rGk3qE",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-03T18:00:09.000Z",
//      "id": "6433bf0e31032501036fc557"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Get Ready",
//      "key": "UqzKzugvtR0",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Teaser",
//      "official": true,
//      "published_at": "2023-04-01T22:26:50.000Z",
//      "id": "6433be856dea3a00f3986239"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "New Trailer [Audio Described]",
//      "key": "AAE5VZktooM",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Trailer",
//      "official": true,
//      "published_at": "2023-02-16T11:55:59.000Z",
//      "id": "6453972dd48cee00e1337bb7"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "New Trailer",
//      "key": "JqcncLPi9zw",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Trailer",
//      "official": true,
//      "published_at": "2023-02-12T23:38:36.000Z",
//      "id": "63e979add388ae00d2b3235c"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Official Trailer [Audio Described]",
//      "key": "mbSjGjNeYnw",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Trailer",
//      "official": true,
//      "published_at": "2023-01-10T16:48:30.000Z",
//      "id": "64539756091e620165312b96"
//    },
//    {
//      "iso_639_1": "en",
//      "iso_3166_1": "US",
//      "name": "Official Trailer",
//      "key": "u3V5KDHRQvk",
//      "site": "YouTube",
//      "size": 1080,
//      "type": "Trailer",
//      "official": true,
//      "published_at": "2022-12-01T22:01:32.000Z",
//      "id": "638925be0398ab0084056a07"
//    }
//  ]
//}
