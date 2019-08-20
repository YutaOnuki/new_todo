require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe "GET api/tasks/" do
    before do
      @task = create(:task)
      get api_tasks_path
      @json = JSON.parse(response.body)
    end

    it '200が返ってくること' do
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it '正しくjsonを返却すること' do
      expect(@json["task"][0]["name"]).to eq @task.name
      expect(@json["task"][0]["is_done"]).to eq @task.is_done
    end
  end

  describe "POST api/tasks" do
    before do
      @params = { name: Faker::Name.name }
    end

    it 'レスポンスが成功で返ってくること' do
      post api_tasks_path, params: { task: @params }

      expect(response).to be_success
      expect(response.status).to eq 201
    end

    it 'Taskのレコードが1件増えること' do
      expect { post api_tasks_path, params: { task: @params } }.to change(Task, :count).by(+1)
    end
  end

  describe "PUT api/tasks/:id" do
    before do
      @task = create(:task)
      @name = Faker::Name.name
    end

    it 'レスポンスが成功で返ってくること' do
      params = { name: @name }
      put api_task_path(@task.id), params: { task: params }

      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'Taskのレコードが更新されること' do
      params = { name: @name }
      put api_task_path(@task.id), params: { task: params }
      @json = JSON.parse(response.body)

      expect(@json["task"]["name"]).to eq params[:name]
    end
  end
end
