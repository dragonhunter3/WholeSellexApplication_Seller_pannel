class EnteryModel {
  final String? title;
  final List<EnteryModel>? children;

  EnteryModel(this.title, [this.children = const <EnteryModel>[]]);
}

List<EnteryModel> data = <EnteryModel>[
  EnteryModel("Dashboard"),
  EnteryModel("Products", [
    EnteryModel("Add Product"),
    EnteryModel("Schdule Product"),
    EnteryModel("All Products"),
    EnteryModel("All Biddinngs"),
    EnteryModel("Earnings"),
  ]),
  EnteryModel("Orders", [
    EnteryModel("Pending Order"),
    EnteryModel("Cancel Orders"),
    EnteryModel("Completed order"),
  ]),
  EnteryModel("Chat"),
  EnteryModel("Discount"),
  EnteryModel("Settings", [
    EnteryModel("Notification Settings"),
    EnteryModel("Payment Methods"),
    EnteryModel("Profile Settings",
        [EnteryModel("Change Password"), EnteryModel("Set Profile")])
  ]),
  EnteryModel("Help and Supports"),
  EnteryModel("Logout"),
];
