*** Settings ***
Documentation    ...TODO
Library     SeleniumLibrary


*** Variables ***
#Str variables:
${HUB TITLE}                      KNIME Community Hub

#Locators:
${SIGN IN BUTTON}                 //*[@id="__layout"]/div/div[1]/header/nav/div[2]/button
${USER ICON}                      css:nav[role="navigation"] div[class="login"] button

##Navigation:
${HOME LINK}                      css:header a[href="https://www.knime.com"]
#Would this work in any place of the page? i believe yes, as long as i stay withing "hub.knime.com/..."
${HUB HOME LINK}                  css:header a[href="/"]
${NAV MENU BUTTON}                css:nav[role="navigation"] button[title="More KNIME"]
${SOFTWARE NAV LINK}              css:nav[role="navigation"] a[href="https://www.knime.com/knime-software"]
${BLOG NAV LINK}                  css:nav[role="navigation"] a[href="href="https://www.knime.com/blog"]
${FORUM NAV LINK}                 css:nav[role="navigation"] a[href="https://forum.knime.com"]
${EVENTS NAV LINK}                css:nav[role="navigation"] a[href="https://www.knime.com/learning/events"]
${DOCUMENTATION NAV LINK}         css:nav[role="navigation"] a[href="https://docs.knime.com"]
${ABOUT KNIME NAV LINK}           css:nav[role="navigation"] a[href="https://www.knime.com/about"]
${PRICING NAV LINK}               css:nav[role="navigation"] a[href="/site/pricing"]
${ABOUT HUB NAV LINK}             css:nav[role="navigation"] a[href="/site/about"]
#There is 2 about knime hub <a> tagged links, why? Both directs to href="/site/about"


*** Keywords ***
