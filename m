Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB0211A14
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513091; cv=fail; b=i9reJLkTBp5x/JxcYda0ffsr1BjBgKLnPuzBMkUEhWgh/kZuOQXRIn7Fo8wRMtLDZxegfLOohu9J/qgfCaWfxmnRP4aHzyyAsGZlAf1cJc/8YO78cS2mdvqeJbY/ui735h6MlLq7gIQ3MWDeeaED1Hkfe6kH6MThFErylPOiJ7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513091; c=relaxed/simple;
	bh=jLBZZDNsaHdK6l7C3g8JR1a3wBn/FRbWEdvkTeda8Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rJuVZSN0J98GyOj1IITAd9qcrl09AnW1SRROCzZvBzeQqXkLwDhdP3+MvFxiyDK6qAyXsZrmQwCX58doTr7aTPvqAz2UFZ3dZk8+NzZAhJtupCFfVNImlFUjBv/htbRvLLLNLmzKOCdwOFXuVMSwxGi6cu4WIBvG3OSW1ePcHIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UtAZEYb7; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z7OgyYjI reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UtAZEYb7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z7OgyYjI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AILO8R1011252
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mDaIvX7o1mSMfbc5cpz1xd7bNUcUYw14zpN/+x2iP/E=; b=
	UtAZEYb7UG3DFMf8ZKpyEftyPahHUhPFIjcjU4qmGNVoqoIakLoU5nUNzGgqLwdG
	MVzuaVN14EHDLvlYzyMi6uDzcWdMGdsIQ9OvoKLAGEXXNU4snRhqpVgkQd9UgD+/
	SNXg9eM8Woh1Yp0qfIY8zNwEVkicw0Xe4naqnO3fnoS5axHSB3VdTwwNDySZmvn5
	zSPyd6wnQ0p64IKtkH3YHZjd1R81ZWTzU2XOm/weHNsSgMUbjVjCB+OY7o4Rfbvx
	nMb90Q+rdP9UjJe1IXbcY8bUvIYqdO9pFfV1Q29sdt3Ms9VKCMtbQCNhyC1spLRU
	7BgbTJdkqVLm6JYc+hFDUw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbbx458-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:44:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ00NTg009450
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:44:48 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefydxdsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCC0TFAF4EMq3Y2ahO/H35FhcIJs9lqQ0kbGmJ/w4uZ5qwJxdWnL73qK2+wD24HESSjiw8/eoHLcOdcsgtHutHg3EqQBEku2abUVFhKUoHPfcedZRG6USIbZ7HPZ5W0BPN1+iT2nOkd/cSIiugkM77P3DOGxQ0liQMRy03SDpKn4WrX7Vqa4RwSmB7I0B9svx/0nqCHJpU6C27MRtEZ+GDlxVcqYYfOtXJESe2sfi31w71tJ0f6uRtKUf0yMwLkGhTMIiAOushxwSTvV/MzizGT6QvhXAzuWAU3jw7L+RqL+SWPTRqvVi01Yll7IAkRF842vQnWt7LiPPls1CjXr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlBExuq5xruf6s0GIxpZMF9ltilywQ3H805jSneITdM=;
 b=NXKwCFzpELA8h0cgAqWMQJV8Dhnw1cKpSj9/o+0RV1Nu5QfcWl1YMUiewo/CH1qLzUFjBkvM9aDL8GXjnWvAEol7pViTpMpr3W1vyYBDq20dZQLW8rFz4PFG3FASC+y27BSnooE7uIAKW2lnHfT3MkOw6inhKk8qaaNgcg/45Lf1VWhhN/D7B72trvAotMljPipGYvOY67AfmZcqfTKhwDmt1WAaoKc+5DnlGASkMnZ2K9Fmz+pIKv7Trb12NyfX6BNZGOuZor44w7SPFIz3uuzwhrbCooxbCd5jlSR7Ukhiz0f6waPD+firP5e996dOcDUT+IL54ZVEDBCG8w3rww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlBExuq5xruf6s0GIxpZMF9ltilywQ3H805jSneITdM=;
 b=z7OgyYjIAtwNdD6bNpgj3LOr8NZ8A3Zd3V3xJG5nzQ1DEo6Mq1fS910WrtFVNp9rsXsHMTAmciU/tye8r5yFjtnAMe0FzLxwX4iVa12r95FALfsQIcojMXwXIiyPJpGUUoycNpPraxf2GN8Tskwo4XoDe1VwVTcvf3XvjWM47Pw=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 19 Nov
 2025 00:44:45 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 00:44:45 +0000
Date: Tue, 18 Nov 2025 19:44:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] doc: Add stapsdt provider documentation
Message-ID: <aR0S+YpnXNaipnez@oracle.com>
References: <20251118043036.16867-1-eugene.loh@oracle.com>
 <ecf085d1-1ef7-4edc-8bcc-a98d3c583233@oracle.com>
 <be44a5bf-aaca-b98c-731b-9945ea837702@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be44a5bf-aaca-b98c-731b-9945ea837702@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: a33a870d-00f9-447d-2da0-08de2704d571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?BMuW/EF9LXDrGKLI7k9WgyVnD7cWFgArGvoj5gERuQSiPqvEGHaK5gKk7P?=
 =?iso-8859-1?Q?f5HsxH/l6+WAs6SA+/NsE5vEtLQ4iHo9A6JkQAq+5L41mIOKz3dv4Aw49S?=
 =?iso-8859-1?Q?c2MPP5/GjyiFmOhJ+H9G0N9K/5jfYikWGcLMbx091WKyzg5mQjwxCY8ayQ?=
 =?iso-8859-1?Q?PSaBqztVRS5i/EszipNjNq03ll2ieZy39rTIIIooq3ftu38X1gzTsCRGfJ?=
 =?iso-8859-1?Q?XU2CJ6kkazE+wuTOxoRiD6dTOHIghUtsuOiqgnONujHM2vSSvhIy579OfO?=
 =?iso-8859-1?Q?y1FeLfvtBmpI5TLDmdcboT1/wjyDPoRzJRutaFXD9GpN9jGWY7I4GNdUg5?=
 =?iso-8859-1?Q?Qs9fSGHHZBAnZ1ZvyUskbT/uBk6InFyj7i5aCN9E/s2M23WSWqmdA9TG/5?=
 =?iso-8859-1?Q?Z89YgPrQbyVbwXamt/27vg6YfDIgZnCWjhW/+I74yjHher3QRhRC5V+U0k?=
 =?iso-8859-1?Q?6m+Io+NWfd5Qv0qXdwvrzotLu3EAi5grUoiY4QaV3kiZxio3xiAIgH5SPb?=
 =?iso-8859-1?Q?janVI75k9SqnHdJVx5rCVA1PmbuV8fQxvPknL9uxFlXKFpb+/6bIo+vhkj?=
 =?iso-8859-1?Q?tHTqBpCh8eem1sDO3B3ck2/GKdOPK3UMT2BcXIvqMdi2x9YLLYb6lHjqSk?=
 =?iso-8859-1?Q?eVHEjsDt6hwyA088sSBgh2+DGislfsfgbp11LWR0jIk+T9QPK/DF1WYWUU?=
 =?iso-8859-1?Q?tTqYxzlbS2Kx3ELQB88rMNLLfh3T11GezCEXHRqigJzFYOnPZHXRORT8lh?=
 =?iso-8859-1?Q?BRQB18rr4T/PKTTuci9e8BqtkaQBXbvB9NUDBAlQf1bcTrQxcNjr1eje7M?=
 =?iso-8859-1?Q?81PvCnkcpeiBKLE/hyL6FEm2S+aNCfehF5pHK6BMHAmYctp4HY0mSUdpBa?=
 =?iso-8859-1?Q?oqTqm8MkLBRZMkuS1xRa1frcPswPhhyg22m5WjipVI5TEbrcB+zFZII5qx?=
 =?iso-8859-1?Q?uC7tvdBqlbM8Jn0Hh+YM5WpTS+4I/PbxmLQlzAV7Vkqv3lz4xZ+AaCPEFB?=
 =?iso-8859-1?Q?DBJa3eu0n1dl6ofyy1wEZI47ngGRngt0P4aQiWxUmH4p7t34wixLAKFm5I?=
 =?iso-8859-1?Q?iKQkmHd0zgL0wX6rNEvP2zg8zRYiWvJ78/ddcKK+SM1+DGYSVYga0eLzBc?=
 =?iso-8859-1?Q?DLCvc0kwYtQU3cBNO19D/TzJBVVYcIO142PJfH6EaOf3tIylfJwh0Jn/Le?=
 =?iso-8859-1?Q?FmuTsewbRmpZHXTi2l9uHsQauHpT2sqeZxlLWt1Axl4gnUvxDrm64fkdMl?=
 =?iso-8859-1?Q?x9eHlM7POtj/51sA7gw+SHjeEEgOSN28PuTNvqM1966HlWpIY1VF1XD6jR?=
 =?iso-8859-1?Q?z1ulAjtGFONqNpKv9orgdLGttGSwOcgtdPaKsctXGMpyYPzhae+1OcTIhO?=
 =?iso-8859-1?Q?/7xxV6xxHXqkNBbA50lDWF+V6rD8ax7h4ilIl37fqFBR9fufeR8/JvzN8y?=
 =?iso-8859-1?Q?gWOKOUdiCSx0Pm2LZQ5MSDRwF5GOfV5sPTgesBES3BOiLC47zh4j6/7HWe?=
 =?iso-8859-1?Q?Z5yQ8oXTeZlido9CK5dw1j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lP+QQuH4hWm4Yy3PHV+Eni1KS2xyDch+c8zmK6BzgAy627dyT08nwjI1D0?=
 =?iso-8859-1?Q?D38DPEUWVsqbNFF3IsNSMVfZHP2Kd+6GjI1OUiJoYUiWrLwRLTQra/qH9H?=
 =?iso-8859-1?Q?c8ANsUlOaUYLOJeSGxhnVejsZOU9zGERP7Q2oe7PWFF2sA4Zc8Hz4mjYOg?=
 =?iso-8859-1?Q?t3ox5PJ12PmbOleYIOl0FRLmQ8LUfUvnl26bNLsUyfE+hIlxs7rgJK4wmE?=
 =?iso-8859-1?Q?2RWh+Y4aehhYohT7oEQshEFNntHuchfNSsb5Vck5t80+lM9r2H6lG7/Ffr?=
 =?iso-8859-1?Q?u2mdwtssp/xL/1Vzz7XoSUKpltfdZR86/re7ZCyACtxI3c79sV8b51+tfD?=
 =?iso-8859-1?Q?7NLNOAvhCqMuryg7KSsVR2jtG6jiyqJrJkaSq7lLsevlEONbuxO8nNYCCD?=
 =?iso-8859-1?Q?sjPbtvDctNzx1mPRTXlnoRwybnxg/veA8fhDiwMkOrghJdfq5Y7W/F5hpG?=
 =?iso-8859-1?Q?LLcpVB6pdfLsj2SX8II4P3JnVgLRIJRBj2D0ddoZE6f4hDzEkCE6zn+itt?=
 =?iso-8859-1?Q?zlVM1CfeF69uz6XBihO5eZIErZAh0J0gF+8YIypau+5Epoj4ZHeXULWmnx?=
 =?iso-8859-1?Q?7x5qtThph3p8rcvH59NAj+2iVrEKLQCQM6r0mCSMimGqAZUgwghJ0yyDcb?=
 =?iso-8859-1?Q?umAKgqX0hFgdoW+dirSPfl+w3uOqefwprIaD14AsPhLPOOIKqu1For15Tn?=
 =?iso-8859-1?Q?003p+rqQZgojtNCtiymkFNNinh0tg/Amj6Kw4/t2HZSlXbV+GgNTM6l/ka?=
 =?iso-8859-1?Q?LRrTPVpxOfre1W1KP0tEEMygkBzTdEEMNL/13qgB3Pm+RJbcgyfIbyYirM?=
 =?iso-8859-1?Q?JZdBoFqj+Vgolk2OtZNcu+1eR+Jgp8BJEXzweoYZ3otuXVaYSV3qW7edhV?=
 =?iso-8859-1?Q?zvUaFZu8bxhzJf6GMuPx65Q0qxW4soAtJw14YUhQ/z00OTHW2CH/1W9lWp?=
 =?iso-8859-1?Q?3bQIzAd4enraRlZlVVW7zWf+zzyOcJULpSA8k4w/WvpybCRNjqOZxwGV/C?=
 =?iso-8859-1?Q?DnPMYmPqO0HCFVBIX++pLt0AidQNI4kKjs48G+ctS56QwiZQ8zYRuwPKPf?=
 =?iso-8859-1?Q?6OeI+lyGT6hgAhh/gpnkjGl0jARfu++UR3oTw1VtL0S0S+BKSAq0hOYwS7?=
 =?iso-8859-1?Q?/1JKdzaXrmM86JTyxSHMJa66Q2QO3Clt8wEWdbizvLGm74HU5Ts8xG3oWX?=
 =?iso-8859-1?Q?8mSeWBnXnOAZmWPAbKgyLqcQ2Nrh6GBnsQniVZTaGamlrgjeC6kAqK1TgS?=
 =?iso-8859-1?Q?+yMl0rcMgIBjf6WRzlmbtyaI6CSwXis0jqkAZtJ/uWzKzIeQCws+h9szYW?=
 =?iso-8859-1?Q?0Tsocc+0LC54ZyujsqvSgGD9pt3sMEnPtnXcd3ZJlbALdGicGhv8Qcvekr?=
 =?iso-8859-1?Q?zvJwS6KmPGKnMuSyDHEW+uMASBhhKzVoj2cU41H3aAXaNKjJVs/u82FF50?=
 =?iso-8859-1?Q?BWl9Y9jBjHampH6dWaj5i3xoKqCDunLyOjDU6miBB9Ifj5e1+E4vteeovk?=
 =?iso-8859-1?Q?lRw4u4YHkp3fN8G3CwuKERhWRSEEe8TY+DQX/V481vspumv+xM/yKH3Nr+?=
 =?iso-8859-1?Q?XMQ4TTFlV75g1agG4CbsMK7uG8RWq1P2IbepmIIn/o0FsD0h+GsTaX+byq?=
 =?iso-8859-1?Q?Q4hJo3ygeCdrNa72SL8UamEHhC3mLQ+NE7BRU9gccBLccgCp6SUg6z/A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	de04uCyy3SyQkEGmv5VT8OK6Q8hCQcz4+geg/MCRrAEZxzAU8OxAHXVUH5hoimU0b0xhX/zxT+dl13H4fEmhsrVIXP+77B3lcyu6dsJsyxLXJZdKDhR0A+6nlEHi1VF2cjz59YJWMCoTuQam2VdJMAsRfUhPGraWXEF2S3+n56if1ZFgOq6N+LrSLOKYXIsVDUnmnb9NfgPkwMHu+knkgUOwauELHsGi/CTeso1sBS5OwQVUPTl5bBM0dM9wurauhBE81LAkE7VhFcQ7cd8oCaJy+J9DIKSUz08xn8rXTS4DcErh+WIIcDPQdjJTR83c1uBZV/5HJDUtM9AOsvfTm52KpgowD3Q/5LU9tZ3IunVBepR1uqpTWagkbI5JPtSSE/qLwYX52+Ct6hJFWUdgVoNbZ75QlV4VxCvNl/w44CswGdOdQTXhlX1hCFpKLmP1GW7jh1ITfTTX9KhBH9IbxH2kaMUmqU47/jEyzdjtT428iv4+IVuA9nAFJMb0lDu6KFB4QN/PxUQHd4WaMhH8DicsQ9SEfCca5Y5SvWQPqcpd4Z/NJX4E0CkPZ/XFc3Yb6/vaU4rA4Jtsr87242NbmUw96bsxUZKkCxI1Z+IHPYc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33a870d-00f9-447d-2da0-08de2704d571
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:44:44.9324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhJdhCWdYBA3Up/uSh6xU6x/lLo7b+aQOcoimmJi/HPj5FCEV4LXy6ntvzDvk0Sin3YYDmYsDer4B6aGsaUswUoMLjih7Dm3cRwPe3moAmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511190003
X-Proofpoint-GUID: SI5p0fYGCmtRu8LM83tvlspAVfeQmxjn
X-Authority-Analysis: v=2.4 cv=JZyxbEKV c=1 sm=1 tr=0 ts=691d1300 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=7mx5N2K_E4Uen4t0EyIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:13643
X-Proofpoint-ORIG-GUID: SI5p0fYGCmtRu8LM83tvlspAVfeQmxjn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX5VF2Ikr1GiZ4
 tQpJBfbHwJUF8e71p4hkwTe1G9N6Kc1cyakVrw5kbGsU0LJqilitQeo/g+hzXBs7GYjUnELH5CA
 Qvr87SuQ83udhIADKJnD49e/LgaJv0SwP2LqoG6nY6fpE0gMAyTOAPhsSyQJPWDIu2+YnHFfUS5
 DMDOsn1Yl9vhkrcHJGsyvrUfuxFok1xjiALzzptOrMp/DOqMvx6wT9RCoLaZPaVVLK5CgkGvLoH
 nYydL+KAHfcwkL02snYkZgShX8pZpZ46QJtB9F5f5FOHembpztLKYoP5OS/jpZsJmNqF9Xs3y+U
 SQTevu8IXgr9O5fsqLmj7ezW056TXqoVpF7M25HSQME0R9H6n1+CeBZ9uOmNdYgstDT6Ks0ngvP
 XAhtwxYcEWJRPGBj8ENhC5P3AGjj6BSkpCNow6+tZTc7Vpy3r/4=

On Tue, Nov 18, 2025 at 07:15:16PM -0500, Eugene Loh wrote:
> On 11/18/25 07:43, Alan Maguire wrote:
> 
> > On 18/11/2025 04:30, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > looks great, a few small suggestions below, but
> > 
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> 
> Thanks, but...
> 
> > > diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
> > > +    STAP_PROBE3(myprovider, myprobe, argc, argv[0], 18);
> > > +    if (myprovider_myprobe_semaphore)
> > > +        printf("the probe is enabled\n");
> > > +    else
> > > +        printf("the probe is not enabled\n");
> > I found the example a bit confusing. I would have thought:
> 
> (fwiw.  I think it's cool you can check it anyhow, but yeah your example
> makes more sense.)
> 
> > > +Notice that the instrumented source code includes the header file
> > > +`<sys/sdt.h>`.  On Oracle Linux, this file is installed
> > > +by the RPM package `systemtap-sdt-devel`, but the package also
> > > +installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
> > > +in front of `/usr/bin` in your path, or explicitly specify
> > > +`/usr/sbin/dtrace` whenever you want to use `dtrace`.
> > > +
> > Would be good to mention that a double underscore "__" gets converted to
> > a dash (-) in provider/probe names too.
> 
> ... but what does this have to do with stapsdt?  I thought that was a
> general DTrace thing that would not need to be called out specially here.

I agree - this is standard in DTrace so I don't think it needs to be pointed
out.  Is it done that way in systemtap as well?  If so, no need to mention it.
If systemtap does *not* do that, I would mention it here because that would be
a deviation from systemtap.
