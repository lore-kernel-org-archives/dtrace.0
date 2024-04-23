Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42C17C73
	for <dtrace@lists.linux.dev>; Tue, 23 Apr 2024 03:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713843117; cv=none; b=cA3rFss8oEhf4E3WOG8TwNnFWiSZRecnS5p7lOvy4jMTVWcgWkZDkAPnumfPTXzSTrTH33jozlZfZr4d12vvA8D9gXZGv7h34RnSRW5uuwd/6tB+o5EfdjO57X8OZca/FBlnhHqX7GK5xlZr9IzuhHVlOPur04i7WVMSHBMW4m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713843117; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=s7wdMPpRNdQVzuz5dB6zJv3GF8hfYvK1Sq1R/7/OdkZCtxKPjU3C3qace1NfZBh4H9icaGbx8qqtOchk7LjIlfQxYaUF0LmaP84P0DoE7WHXjVHGilmH1cnR39LdsQR1HqFrp7gRP+g6UpxrGb+5BqDCCc6p+S6/f0IKhVJRvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=SfbNmtfU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="SfbNmtfU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51b2f105829so2357052e87.3
        for <dtrace@lists.linux.dev>; Mon, 22 Apr 2024 20:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1713843113; x=1714447913; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=SfbNmtfUg882qgrVcoxNAv6nBSGNUer1WsC5VXtFsAyt307wh28FwSx/RV4dr2xjPN
         mMJHnlHcTKPbXBuDDt2u33iAmuqusc6GmiSCyf2ol+TwmNTBmrRmwdtbQ4l17kePUOgG
         pSpj5xfm+cisdfOjwRDl4ZzRF1ryrgGS/5rvOKSiuDtJFBossK4XnQugzsHwciSiOv5D
         RORV9rxRQ6vmaah2SovizuxYaqa0C87exp2j7OgiiFlODbR7dK4uZskYxo8gHIAT0MzF
         b/SirbJnfSSDHe3gtt9y5R/8XtXY8y0l29W9jrshmHsPUir/kWQjuE/DOTYQJQw51Qg+
         /2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713843113; x=1714447913;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=J4ao/5+hPn3gh6BbV0DxHmETh6K43UTjWTuYNkCq1amGloZZMRClltlBbqR2CXvmbj
         rfrnm73sxJYPOGBwU5Rb6m7Rnu2z4uZLNez2+pKOHNzvCrzNAUUy16MxmSk0qKyQGRiY
         pIaIbZRiB8M7L+GJ4yandNSMS5uiW+SSWGTMN6Diii4HeX+u/9ASDGWLnoW8pheHjeSj
         LjW36qlUmsNcGKvuaa0tBhWbmJlh9on5SS8pHae139PLruBR7zmRC922iUN/97RPbOww
         1v8kU7Kz1dX/WtWedNlbhfJArkmxkgtGMpT07y3f0y6xYibsW/8IklTZCUJJ+yBJpbgl
         DWpw==
X-Gm-Message-State: AOJu0YyT6w13er8GHrWN0UXoVjgz+l1EFEmSNvqOUuxX4Q/c3PIH2KuM
	buB4r9FO5iovnGQgDxRqptrN/evETrfUU1dwCGottEVicUL74gnPz3qihZvnoYG1MSc85+ZKJtG
	uANPDPVA20vnoz1x7NKgYkVKxgCJYnSleisaB0jNODasIObnvVg/Vtw==
X-Google-Smtp-Source: AGHT+IFHFRrm0V1bTz2ZZaQdWzrU31n3DM78YnRZpwn1hIM4UDJb/KMYJfZjIU6Zn7cXW5YRX2YeDUYrltfppUyzfwY=
X-Received: by 2002:a19:6912:0:b0:518:c69b:3a04 with SMTP id
 e18-20020a196912000000b00518c69b3a04mr8998423lfc.0.1713843112639; Mon, 22 Apr
 2024 20:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Tue, 23 Apr 2024 09:01:41 +0530
Message-ID: <CAH=dH99jsnHkhrF15KMq8Bh-wgQa1DpDJiX-3SVfczMu7bhQUA@mail.gmail.com>
Subject: Test Mail
To: dtrace@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
