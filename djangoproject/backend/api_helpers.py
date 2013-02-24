from tastypie.resources import ModelResource

''' Bundles a enumeration of items in a way that it can be sent using JSON.
'''
def bundleItemCollection(modelResource, request, items):
    item_list = []
    for item in items:
        bundle = ModelResource.build_bundle(modelResource, obj=item, request=request)
        bundle = ModelResource.full_dehydrate(modelResource, bundle)
        item_list.append(bundle)
    return item_list;