class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attachment :profile_image, destroy: false
  has_many :books
  has_many :favorites
  has_many :book_comments
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :chats
  validates :name, presence: true, length: {maximum: 10, minimum: 2}
  validates :introduction, length: {maximum: 50}
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :street, presence: true

  # jp_prefectureをUserモデルにinclude
  include JpPrefecture
  jp_prefecture :prefecture_code

  # geocoderにより、保存・更新時に住所から経度・緯度データを生成
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    prefecture.name + state + city + street
  end

  # フォロワー
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followee_id'
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  # フォローしている人
  has_many :relationships, foreign_key: "follower_id"
  has_many :followings, through: :relationships, source: :followee
  
  def following?(another_user)
    self.followings.include?(another_user)
  end

  def follow(another_user)
    unless self == another_user
      self.relationships.find_or_create_by(followee_id: another_user.id)
    end
  end
  
  def unfollow(another_user)
    unless self == another_user
      relationship = self.relationships.find_by(followee_id: another_user.id)
      relationship.destroy if relationship
    end
  end

  # chat_roomの整理
  def create_or_find_room_by(user_id_array)
    user_id_array.append(self.id).map!(&:to_i).sort!
    if self.rooms == []
      room = Room.create
      user_id_array.each{|uid| room.user_rooms.create(user_id: uid)}
      return room
    else
      found_rooms = self.rooms.select{|r| user_id_array == (r.user_rooms.pluck(:user_id) & user_id_array)}
      if found_rooms.count < 1
        room = Room.create
        user_id_array.each{|uid| room.user_rooms.create(user_id: uid)}
        return room 
      else
        return found_rooms[0]
      end
    end
  end
end 