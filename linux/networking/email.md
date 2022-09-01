
# Basic Configuration

```
$ dnf install postfix
$ systemctl start postfix
$ systemctl enable postfix
```

## Sending an email
`$ sendmail ash@localhost <<< "Test email"`

Check
`$ cat /var/spool/mail/ash`

## Alias creattion
```
$ vim /etc/aliases
imran: ash

$ newaliases

$ sendmail imran@localhost <<< "Another test email"

`$ cat /var/spool/mail/ash`



