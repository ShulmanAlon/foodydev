# require 'spec_helper'

# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to specify the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator.  If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails.  There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.
# #
# # Compared to earlier versions of this generator, there is very limited use of
# # stubs and message expectations in this spec.  Stubs are only used when there
# # is no simpler way to get a handle on the object needed for the example.
# # Message expectations are only used when there is no simpler way to specify
# # that an instance is receiving a specific message.

# describe PublicationReportsController do

#   # This should return the minimal set of attributes required to create a valid
#   # PublicationReport. As you add validations to PublicationReport, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) { { "publication_unique_id" => "1" } }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # PublicationReportsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all publication_reports as @publication_reports" do
#       publication_report = PublicationReport.create! valid_attributes
#       get :index, {}, valid_session
#       assigns(:publication_reports).should eq([publication_report])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested publication_report as @publication_report" do
#       publication_report = PublicationReport.create! valid_attributes
#       get :show, {:id => publication_report.to_param}, valid_session
#       assigns(:publication_report).should eq(publication_report)
#     end
#   end

#   describe "GET new" do
#     it "assigns a new publication_report as @publication_report" do
#       get :new, {}, valid_session
#       assigns(:publication_report).should be_a_new(PublicationReport)
#     end
#   end

#   describe "GET edit" do
#     it "assigns the requested publication_report as @publication_report" do
#       publication_report = PublicationReport.create! valid_attributes
#       get :edit, {:id => publication_report.to_param}, valid_session
#       assigns(:publication_report).should eq(publication_report)
#     end
#   end

#   describe "POST create" do
#     describe "with valid params" do
#       it "creates a new PublicationReport" do
#         expect {
#           post :create, {:publication_report => valid_attributes}, valid_session
#         }.to change(PublicationReport, :count).by(1)
#       end

#       it "assigns a newly created publication_report as @publication_report" do
#         post :create, {:publication_report => valid_attributes}, valid_session
#         assigns(:publication_report).should be_a(PublicationReport)
#         assigns(:publication_report).should be_persisted
#       end

#       it "redirects to the created publication_report" do
#         post :create, {:publication_report => valid_attributes}, valid_session
#         response.should redirect_to(PublicationReport.last)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns a newly created but unsaved publication_report as @publication_report" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         PublicationReport.any_instance.stub(:save).and_return(false)
#         post :create, {:publication_report => { "publication_unique_id" => "invalid value" }}, valid_session
#         assigns(:publication_report).should be_a_new(PublicationReport)
#       end

#       it "re-renders the 'new' template" do
#         # Trigger the behavior that occurs when invalid params are submitted
#         PublicationReport.any_instance.stub(:save).and_return(false)
#         post :create, {:publication_report => { "publication_unique_id" => "invalid value" }}, valid_session
#         response.should render_template("new")
#       end
#     end
#   end

#   describe "PUT update" do
#     describe "with valid params" do
#       it "updates the requested publication_report" do
#         publication_report = PublicationReport.create! valid_attributes
#         # Assuming there are no other publication_reports in the database, this
#         # specifies that the PublicationReport created on the previous line
#         # receives the :update_attributes message with whatever params are
#         # submitted in the request.
#         PublicationReport.any_instance.should_receive(:update).with({ "publication_unique_id" => "1" })
#         put :update, {:id => publication_report.to_param, :publication_report => { "publication_unique_id" => "1" }}, valid_session
#       end

#       it "assigns the requested publication_report as @publication_report" do
#         publication_report = PublicationReport.create! valid_attributes
#         put :update, {:id => publication_report.to_param, :publication_report => valid_attributes}, valid_session
#         assigns(:publication_report).should eq(publication_report)
#       end

#       it "redirects to the publication_report" do
#         publication_report = PublicationReport.create! valid_attributes
#         put :update, {:id => publication_report.to_param, :publication_report => valid_attributes}, valid_session
#         response.should redirect_to(publication_report)
#       end
#     end

#     describe "with invalid params" do
#       it "assigns the publication_report as @publication_report" do
#         publication_report = PublicationReport.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         PublicationReport.any_instance.stub(:save).and_return(false)
#         put :update, {:id => publication_report.to_param, :publication_report => { "publication_unique_id" => "invalid value" }}, valid_session
#         assigns(:publication_report).should eq(publication_report)
#       end

#       it "re-renders the 'edit' template" do
#         publication_report = PublicationReport.create! valid_attributes
#         # Trigger the behavior that occurs when invalid params are submitted
#         PublicationReport.any_instance.stub(:save).and_return(false)
#         put :update, {:id => publication_report.to_param, :publication_report => { "publication_unique_id" => "invalid value" }}, valid_session
#         response.should render_template("edit")
#       end
#     end
#   end

#   describe "DELETE destroy" do
#     it "destroys the requested publication_report" do
#       publication_report = PublicationReport.create! valid_attributes
#       expect {
#         delete :destroy, {:id => publication_report.to_param}, valid_session
#       }.to change(PublicationReport, :count).by(-1)
#     end

#     it "redirects to the publication_reports list" do
#       publication_report = PublicationReport.create! valid_attributes
#       delete :destroy, {:id => publication_report.to_param}, valid_session
#       response.should redirect_to(publication_reports_url)
#     end
#   end

# end
