require 'rails_helper'

RSpec.describe Admin::UsersHelper, type: :helper do
  describe '#user_roles' do
    it 'returns an array of roles with their titleized names and keys' do

      roles_array = helper.user_roles
      expect(roles_array).to be_an(Array)
      roles_array.each do |role|

        expect(role).to be_an(Array)
        expect(role.size).to eq(2)
        expect(role[0]).to be_a(String)
        expect(role[1]).to be_a(String)
      end
    end

    it 'returns the correct roles based on the User model' do

      expected_roles = User.roles.keys.map { |role| [role.titleize, role] }
      roles_array = helper.user_roles
      expect(roles_array).to match_array(expected_roles)
    end
  end
end
