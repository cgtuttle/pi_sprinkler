require 'test_helper'

class ProgramRulesControllerTest < ActionController::TestCase
  setup do
    @program_rule = program_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_rule" do
    assert_difference('ProgramRule.count') do
      post :create, program_rule: { program_id: programs(:one).id, rule_id: rules(:one).id }
    end

    assert_redirected_to program_rule_path(assigns(:program_rule))
  end

  test "should show program_rule" do
    get :show, id: @program_rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_rule
    assert_response :success
  end

  test "should update program_rule" do
    patch :update, id: @program_rule, program_rule: { program_id: @program_rule.program_id, rule_id: @program_rule.rule_id }
    assert_redirected_to program_rule_path(assigns(:program_rule))
  end

  test "should destroy program_rule" do
    assert_difference('ProgramRule.count', -1) do
      delete :destroy, id: @program_rule
    end

    assert_redirected_to program_rules_path
  end
end
