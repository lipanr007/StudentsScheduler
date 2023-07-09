//
//  UserViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User?

    init() {
        self.user = getUser()
    }

    func signOut() {
        self.user = nil
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.user)

            UserDefaults.standard.set(data, forKey: "CurrentUser")
//            self.user = user
        } catch {
            print("Unable to Encode User (\(error))")
        }
    }

    func logIn(username: String, password: String) {
        if let data = UserDefaults.standard.data(forKey: username) {
            do {
                let decoder = JSONDecoder()
                let gotUser = try decoder.decode(User.self, from: data)

                if (gotUser.password == password) {
                    self.user = gotUser
                } else {
                    self.user = nil
                }

            } catch {
                print("Unable to Decode User (\(error))")
            }
        }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.user)

            UserDefaults.standard.set(data, forKey: "CurrentUser")
//            self.user = user
        } catch {
            print("Unable to Encode User (\(error))")
        }
        
    }

    func signIn(user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)

            UserDefaults.standard.set(data, forKey: user.username)
            self.user = user
        } catch {
            print("Unable to Encode User (\(error))")
        }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self.user)

            UserDefaults.standard.set(data, forKey: "CurrentUser")
//            self.user = user
        } catch {
            print("Unable to Encode User (\(error))")
        }
    }

    private func getUser() -> User? {
        if let data = UserDefaults.standard.data(forKey: "CurrentUser") {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                print("Unable to Decode User (\(error))")
            }
        }
        return nil
    }

    func saveCourses() {
        if let user = user {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(user.courses)

                UserDefaults.standard.set(data, forKey: "\(user.username)_courses")
            } catch {
                print("Unable to Encode Courses (\(error))")
            }
        }
    }

    func loadCourses() {
        if let user = user {
            if let data = UserDefaults.standard.data(forKey: "\(user.username)_courses") {
                do {
                    let decoder = JSONDecoder()
                    let courses = try decoder.decode([Course].self, from: data)
                    user.courses = courses
                } catch {
                    print("Unable to Decode Courses (\(error))")
                }
            }
        }
    }
}

extension UserDefaults {
    func getUser() -> User? {
        if let data = self.data(forKey: "CurrentUser") {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                print("Unable to Decode User (\(error))")
            }
        }
        return nil
    }
}
