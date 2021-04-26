Validate Contact
    [Arguments]          ${contact_id}  ${first_name}  ${last_name}
    [Documentation]
    ...  Given a contact id, validate that the contact has the
    ...  expected first and last name both through the detail page in
    ...  the UI and via the API.
    # Validate via UI
    Go to page             Detail   Contact  ${contact_id}
    Page Should Contain    ${first_name} ${last_name}

    # Validate via API
    &{contact} =     Salesforce Get  Contact  ${contact_id}
    Should Be Equal  ${first_name}  ${contact}[FirstName]
    Should Be Equal  ${last_name}  ${contact}[LastName]