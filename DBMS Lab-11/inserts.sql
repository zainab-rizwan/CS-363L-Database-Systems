

-----------Table 1: brands-----------
Declare @brand_id int
Set @brand_id = 10

While @brand_id <= 22000
Begin 
   Insert Into [BikeStores].[production].[brands] values ('Brand Name - ' + CAST(@brand_id as nvarchar(10)))
   Set @brand_id = @brand_id + 1
End

-----------Table 2: categories-----------
Declare @category_id int
Set @category_id = 8

While @category_id <= 22000
Begin 
   Insert Into [BikeStores].[production].[categories] values ('Category Name - ' + CAST(@category_id as nvarchar(10)))
   Set @category_id = @category_id + 1
End

-----------Table 3: products-----------
Declare @brand_id int
Declare @category_id int

Declare @LowerLimitForBrandId int
Declare @UpperLimitForBrandId int

Set @LowerLimitForBrandId = 1
Set @UpperLimitForBrandId = 22000

Declare @LowerLimitForCategory int
Declare @UpperLimitForCategory int

Set @LowerLimitForCategory = 1 
Set @UpperLimitForCategory = 22000

Declare @product_id int
Set @product_id = 1

While @product_id <= 22000
Begin 
   Select @brand_id = Round(((@UpperLimitForBrandId - @LowerLimitForBrandId) * Rand()) + @LowerLimitForBrandId, 0)
   Select @category_id = Round(((@UpperLimitForCategory - @LowerLimitForCategory) * Rand()) + @LowerLimitForCategory, 0)

   Insert Into [BikeStores].[production].[products] values ('Product Name - ' + CAST(@product_id as nvarchar(10)),
   @brand_id, 
   @category_id,
   CAST(@product_id as nvarchar(5)),
   CAST(@product_id as nvarchar(10)) + '$')
   Set @product_id = @product_id + 1

End

-----------Table 4: stocks-----------

-----------Table 5: customers-----------
Declare @customer_id int
Set @customer_id = 1441

While @customer_id <= 22000
Begin 
   Insert Into [BikeStores].[sales].[customers] values 
   ('First Name - ' + CAST(@customer_id as nvarchar(10)),
    'Last Name - ' + CAST(@customer_id as nvarchar(10)),
	'123456' + @customer_id,
	'email' + CAST(@customer_id as nvarchar(10)) + '@gmail.com',
	'Street - ' + CAST(@customer_id as nvarchar(10)),
	'City - ' + CAST(@customer_id as nvarchar(10)),
	'State - ' + CAST(@customer_id as nvarchar(10)),
	CAST(@customer_id as nvarchar(10)))
   Set @customer_id = @customer_id + 1
End

-----------Table 6: order_items-----------
-----------Table 7: orders-----------
-----------Table 8: staffs-----------

-----------Table 9: stores-----------
Declare @store_id int
Set @store_id = 4

While @store_id <= 22000
Begin 
   Insert Into [BikeStores].[sales].[stores] values 
   ('Store Name - ' + CAST(@store_id as nvarchar(10)),
	'123456' + @store_id,
	'Email' + CAST(@store_id as nvarchar(10)) + '@gmail.com',
	'Street - ' + CAST(@store_id as nvarchar(10)),
	'City - ' + CAST(@store_id as nvarchar(10)),
	'1 ' + CAST(@store_id as nvarchar(10)),
	CAST(@store_id as nvarchar(10)))
   Set @store_id = @store_id + 1
End