class Account < ActiveRecord::Base
  def self.get_saml_settings(url_base)
    # this is just for testing purposes.
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = OneLogin::RubySaml::Settings.new

    url_base ||= "http://cozumel-demo3.artis-asp.jp"

    # Example settings data, replace this values!

    # When disabled, saml validation errors will raise an exception.
    settings.soft = true

    #SP section
    settings.issuer                         = url_base + "/saml/metadata"
    settings.assertion_consumer_service_url = url_base + "/saml/acs"
    settings.assertion_consumer_logout_service_url = url_base + "/saml/logout"

    onelogin_app_id = "f59cff71-2e77-4636-9a1b-8f3e16f85b08"

    # IdP section
    settings.idp_entity_id                  = "https://app.onelogin.com/saml/metadata/#{onelogin_app_id}"
    settings.idp_sso_target_url             = "https://app.onelogin.com/trust/saml2/http-redirect/sso/#{onelogin_app_id}"
    settings.idp_slo_target_url             = "https://app.onelogin.com/trust/saml2/http-redirect/slo/#{onelogin_app_id}"
    settings.idp_cert                       = "-----BEGIN CERTIFICATE-----
MIIEYjCCA0qgAwIBAgIUIMvkgtzwIaSppHwSgCKzdFDwN7AwDQYJKoZIhvcNAQEF
BQAwcTE8MDoGA1UECgwz5qCq5byP5Lya56S+44Ki44O844OG44Kj44K544K944Oq
44Ol44O844K344On44Oz44K6MRUwEwYDVQQLDAxPbmVMb2dpbiBJZFAxGjAYBgNV
BAMMEU9uZUxvZ2luIEFjY291bnQgMB4XDTIzMDMxNjAwMzAwOVoXDTI4MDMxNjAw
MzAwOVowcTE8MDoGA1UECgwz5qCq5byP5Lya56S+44Ki44O844OG44Kj44K544K9
44Oq44Ol44O844K344On44Oz44K6MRUwEwYDVQQLDAxPbmVMb2dpbiBJZFAxGjAY
BgNVBAMMEU9uZUxvZ2luIEFjY291bnQgMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
MIIBCgKCAQEAuwjFG0w13Sm5qCIaZRHZGt/um54BGd6CV5/fA1kCkz796CEQaE01
wzMcvbOJEjfie5E7awTZATaIUuDt/qsOyTLKiBcwpvZjDOEGl+ZJn/5nMQyJvHgM
u+bM5La0XpV5VgjQPXE+fZFc2e+Diktgo6/pMjJ+/PBVd2wmOlhbvRqtVBGni2Jf
7qabS/TTOeSzqnFEIeAlgLB0gI87eP4+UvEVKt0yx7COtQxYQc7x0lHAN4+2Wo3p
w5w/58/V0ko3f3PBWpHRHQ36lT0QYq8SZcajdmio57zwo3G1zzB2G4tt5TTr5oYF
YGuA0VDDQjkzWIF67JwEG2MnsFZLIqwv0QIDAQABo4HxMIHuMAwGA1UdEwEB/wQC
MAAwHQYDVR0OBBYEFDYJkVvqOApTO0bjyd6/TkDs71VBMIGuBgNVHSMEgaYwgaOA
FDYJkVvqOApTO0bjyd6/TkDs71VBoXWkczBxMTwwOgYDVQQKDDPmoKrlvI/kvJrn
pL7jgqLjg7zjg4bjgqPjgrnjgr3jg6rjg6Xjg7zjgrfjg6fjg7PjgroxFTATBgNV
BAsMDE9uZUxvZ2luIElkUDEaMBgGA1UEAwwRT25lTG9naW4gQWNjb3VudCCCFCDL
5ILc8CGkqaR8EoAis3RQ8DewMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQUF
AAOCAQEAJN8E73FjOL6ftgSbZ2pwG2w0lMr5dy6b9z79/c4MfzTKjK3G2fDNzfPI
lGMtFDaUQTDyqr2A9aT2FzALPGlP9el3kbiEeolvZGJdGNv9HcALKbA8C6Om9xZw
7prFnDIQ9vWc+dH+1VxwDqcBNCVTAHxibTcDbueB5BISVwJV/G87d9ZminJDrw0F
rjpp+MxWfSrr1nr0bWcW48l7i+hmBaKCBt7ctSWpOmgUZfiXmV5NKu0Js0y+7EZB
FB6rYXTslm6pgbocX62IXG1ArxXOcAHrmJ+WbyMAUkOALfEM08IuNC4LmQAJ9egR
KNOp2irTZc/c+Ze1OHDHLNsaXTd4tw==
-----END CERTIFICATE-----
"


    # or settings.idp_cert_fingerprint           = ""
    #    settings.idp_cert_fingerprint_algorithm = XMLSecurity::Document::SHA1

    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    # Security section
    settings.security[:authn_requests_signed] = false
    settings.security[:logout_requests_signed] = false
    settings.security[:logout_responses_signed] = false
    settings.security[:metadata_signed] = false
    settings.security[:digest_method] = XMLSecurity::Document::SHA1
    settings.security[:signature_method] = XMLSecurity::Document::RSA_SHA1

    settings
  end
end
