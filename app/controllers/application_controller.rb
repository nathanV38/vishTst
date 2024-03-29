﻿# Copyright 2011-2012 Universidad Politécnica de Madrid and Agora Systems S.A.
#
# This file is part of ViSH (Virtual Science Hub).
#
# ViSH is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ViSH is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with ViSH.  If not, see <http://www.gnu.org/licenses/>.

class ApplicationController < ActionController::Base
  before_filter :detect_mobile_request

  protect_from_forgery

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "devise"
    else
      "application"
    end
  end

  private

  def detect_mobile_request
    request.format = :mobile if (request.format == :html and request.host.split(".").first == 'm') or (request.format == :html and request.host.split(".").first == 'fruta')
    request.format = :jsmobile if (request.format == :js and request.host.split(".").first == 'm') or (request.format == :js and request.host.split(".").first == 'fruta')
  end

end

