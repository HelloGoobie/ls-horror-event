fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Goobie'
description 'Morgue Horror Event'
version '1.1.0'

-- ============================================================
-- CLIENT / UI
-- ============================================================

client_scripts {
    'client/horror_client.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/*.mp3',

    'peds.meta'
}

-- ============================================================
-- PED METADATA REGISTRATION
-- ============================================================

data_file 'PED_METADATA_FILE' 'peds.meta'

