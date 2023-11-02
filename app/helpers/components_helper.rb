module ComponentsHelper
  def component(path, *args, **kwargs, &block)
    # path should be the path under 'components/'
    # ex: path = 'button'

    name_space = path.to_s.split('/').last.classify
    name = "#{name_space}Component".classify
    object = "#{name_space}::#{name}".constantize

    render object.new(*args, **kwargs), &block
  end
end
