[DefaultOutputDestinationSettings = [DestinationDefinition = [Kind = "Reference", QueryName = "DefaultDestination", IsNewTarget = true], UpdateMethod = [Kind = "Replace"], DestinationTypeSettings = [Kind = "Table"]], StagingDefinition = [Kind = "FastCopy"]]
section Section1;
shared DefaultDestination = Lakehouse.Contents([EnableFolding = false]){[workspaceId = "9e7137d9-86ac-49ed-a6bf-cafe88d880d8"]}[Data]{[lakehouseId = "a2cbd6c3-f387-4f22-9c45-ed2d1fde299e"]}[Data];
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "orders_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "SalesOrderID", DestinationColumnName = "SalesOrderID"], [SourceColumnName = "OrderDate", DestinationColumnName = "OrderDate"], [SourceColumnName = "CustomerID", DestinationColumnName = "CustomerID"], [SourceColumnName = "LineItem", DestinationColumnName = "LineItem"], [SourceColumnName = "ProductID", DestinationColumnName = "ProductID"], [SourceColumnName = "OrderQty", DestinationColumnName = "OrderQty"], [SourceColumnName = "LineItemTotal", DestinationColumnName = "LineItemTotal"], [SourceColumnName = "Custom", DestinationColumnName = "Custom"]}], DynamicSchema = false, UpdateMethod = [Kind = "Append"], TypeSettings = [Kind = "Table"]]]}]
shared orders = let
  Source = Csv.Document(Web.Contents("https://raw.githubusercontent.com/MicrosoftLearning/dp-data/main/orders.csv"), [Delimiter = ",", Columns = 7, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(Source, [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"SalesOrderID", Int64.Type}, {"OrderDate", type date}, {"CustomerID", Int64.Type}, {"LineItem", Int64.Type}, {"ProductID", Int64.Type}, {"OrderQty", Int64.Type}, {"LineItemTotal", type number}}),
  #"Added custom" = Table.AddColumn(#"Changed column type", "Custom", each Date.Month([OrderDate])),
  #"Changed column type 1" = Table.TransformColumnTypes(#"Added custom", {{"Custom", Int64.Type}})
in
  #"Changed column type 1";
shared orders_DataDestination = let
  Pattern = Lakehouse.Contents([HierarchicalNavigation = null, CreateNavigationProperties = false, EnableFolding = false]),
  Navigation_1 = Pattern{[workspaceId = "9e7137d9-86ac-49ed-a6bf-cafe88d880d8"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "a2cbd6c3-f387-4f22-9c45-ed2d1fde299e"]}[Data],
  TableNavigation = Navigation_2{[Id = "orders_1", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
