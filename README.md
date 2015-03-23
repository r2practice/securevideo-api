# Securevideo::Api

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/securevideo/api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'securevideo-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install securevideo-api

## Usage

### Config client
    ```
    Securevideo::Api.configure(KEY, SECRET)
    ```

## API

### Users (https://hub.securevideo.com/Knowledge/Details/81)

#### get users
    ```
    users = Securevideo::Api::User.all.fetch
    ```

#### get user
    ```
    Securevideo::Api::User.find(user_id)
    ```

#### create user
    ```
    user = Securevideo::Api::User.new(FullName: 'Test User',
        TimeZoneWindowsId: "Pacific Standard Time",
        EmailAddress: 'test@test.com',
        HelpNumber: '4084062331')
    user.save
    ```

#### update user
    ```
    user = Securevideo::Api::User.find(user_id)
    user.FullName = 'Test User2'
    user.save
    ```

#### delete user
    ```
    user = Securevideo::Api::User.find(user_id)
    user.destroy
    ```

### Session (https://hub.securevideo.com/Knowledge/Details/86)

#### Get sessions of user
    ```
    sessions = Securevideo::Api::Session.all(UserId: user_id).fetch
    ```

#### Create a new session
    ```
    session = Securevideo::Api::Session.new(UserId: user_id, "ScheduleTs": "2016-04-16T15:00:00", "Participants":[{ "ParticipantFullName": "Trevor", "ParticipantEmailAddress": "trevor@geemail.com", "ParticipantSmsNumber": "3124455566", "ParticipantDefaultResolution": "default", "ParticipantTimeZoneWindowsId": "Hawaiian Standard Time", "ShouldAutoDeliverCode": "S"}])
    session.save
    ```
#### Reschedule a Session
    ```
    session.reschedule("2017-02-04T22:00:00")
    ```

#### Cancel a Session
    ```
    session.destroy
    ```

### Participant (https://hub.securevideo.com/Knowledge/Details/88)

#### Add Participant to exist Session
    ```
    Securevideo::Api::Participant.add(session_id, participant_options)
    ```

    ```
    Securevideo::Api::Participant.add(12344, { "SecureVideoUserId": "1122"})
    ```

    ```
    t = Securevideo::Api::Participant.add(35508, { "ParticipantFullName": "Trevor", "ParticipantEmailAddress": "trevor28@geemail.com", "ParticipantSmsNumber": "13124456666", "ParticipantDefaultResolution": "high", "ParticipantTimeZoneWindowsId": "Eastern Standard Time", "ShouldAutoDeliverCode": "S",})
    ```

#### Remove Participant from exist Session
    ```
    Securevideo::Api::Participant.remove(participant_id)
    ```

### How can I view session usage via the API?
    ```
    reports = Securevideo::Api::Session.usage('2015-03-01')
    ```

### Login & Logout (https://hub.securevideo.com/Knowledge/Details/89)

#### Login API
    ```
    session = Securevideo::Api::Session.login(user_id,redirect_to_on_expiry)

    return
    {
        "LoginGuid": "c1a714554134958fda34d32ebb4c070de1579430ba1471ba8d4c0b2b6e8ba8d6",
        "RedirectToUriOnExpiry": "https://www.mywebsite.com/HandleSecureVideoLoginExpiration",
        "LoginUri": "https://hub.securevideo.com/Account/Login?auto=c1a714554134958fda34d32ebb4c070de1579430ba1471ba8d4c0b2b6e8ba8d6"
    }
    ```
#### Logout API
    ```
    session = Securevideo::Api::Session.logout(LoginGuid)
    session = Securevideo::Api::Session.logout("c1a714554134958fda34d32ebb4c070de1579430ba1471ba8d4c0b2b6e8ba8d6")
    ```

### Password API (https://hub.securevideo.com/Knowledge/Details/122)

#### Set a User Password

    ```
    user = Securevideo::Api::Session.find(user_id)
    user.update_password(new_password)
    ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/securevideo-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
