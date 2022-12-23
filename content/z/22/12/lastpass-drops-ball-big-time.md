+++
title= "LastPass was breached a week ago; turns out that breach inclued backups of user vaults"
date= 2022-12-22T05:44:00Z
+++

Article: [Mitchell Clark @ The Verge](https://www.theverge.com/2022/12/22/23523322/lastpass-data-breach-cloud-encrypted-password-vault-hackers)

Press release [from LastPass](https://blog.lastpass.com/2022/12/notice-of-recent-security-incident/)

---

Last month, LastPass announced that it had a data breach that had "certain elements" of customer info go awry. Today, LastPass has announced that those "certain elements" were backups of customer account data (billing addresses, email addresses, telephone numbers, IP addresses) as well as a copy of "a backup of customer vault data." LastPass has stated that "encrypted fields remain secured with 256-bit AES encryption and can only be decrypted with a unique encryption key derived from each user’s master password using our Zero Knowledge architecture. As a reminder, the master password is never known to LastPass and is not stored or maintained by LastPass."

LastPass dropped the ball big time here. The fact that they haven't been transparent about these things and being so slow to be make sure people know what's at stake for people is terrible. All it takes is enough time to bruteforce an account with a pisspoor password to lose important accounts or worse (please use two-factor authentication!!). If you're a LastPass user, please switch to either [Bitwarden](https://bitwarden.com) or some other solution that has a reputation for being reliable like [1Password](https://1password.com) or [RoboForm](https://roboform.com) (I'm surprised RoboForm is still around tbh).
