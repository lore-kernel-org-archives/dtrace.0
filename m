Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555B1CFBC
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825340; cv=fail; b=FtS4lIkswtmCl4rTTlG3dP6F9zyhnSsevi1KA0TG+5ff6tvWM4iPqdRuEUhY0uQfIWZGSP+TK/judv8gQzur8BkhfiE0R3CjyXgMpuSx5INItT/+7IOnbLovtmyiEJmqWD6ax/bEy/9YgrJMhYoSp8a5eYpsypwaPv1k73vWJWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825340; c=relaxed/simple;
	bh=4E8MEGLYeg02Gv5GaLDnl++XOwZ7i4teFbTnvXWCF3A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=UFMYqUFFfmxncIu4X+g1HVzDse8n411IgrhmMw5HaPmPxbhSGTHoJ40THgINQdUmlSYLHCfF6UPasfF+uC5UQ4XeXE8oI/RI0NIlSookeb4dymGvFoxEvCC2fWFvA2FQSzNBF6aHfsECFgxkvCdP5xIhopBSa9cYCTTF0RSpEhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YTqhh1QD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DAjv/7cd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YTqhh1QD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DAjv/7cd"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdn7005769
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iEdeOdv88oRlvWiBoG
	gfRM75RBqg4nmjmZCnACa+K7g=; b=YTqhh1QDq5lfKAjb4dMD7IzhpD+9Pt4/9o
	j9CFxUh/sFWSQXm7CDkYz9oCLM+jC7hMXGPv2Zif9o5Utf0HyEJKJGdhvvn1v9iX
	qhKHNBmGutk57ekGnXGUYvAllASK+lKR593Yw4iXQieIHnmx4ZL37V1hzB9PhdQf
	OACsxKO53hZiCOi/5lIi7QGi15JjXJD9yB876jJ5R1Wv6Ll+ID3SQ+fX7XsiosM/
	Am7+jZWy2K5UoO2UevVYsqDmPSphJKIGPWADCFqb4XfOnV2X80dQhplazMPqmrGv
	A7OeyJpgfMixs09dBKUVNkUHO1lcdnxjaHgaMzrlZIROAreachzA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbekpq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDufa8040733
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:37 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvdyry2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PG1s1YwtaksaZ9IEssPa4yv1UbCIZfCma1wyBf8U5lCJkTlb/CojJWkoxy8g3cqIMvEgEj9x0UQhckSeL8V7rwfujYArWEBl30Aj8y7UX2Iu4GcAxLy4xte8C7WW4dLhe2XHYeeuJCknDKBWyYlA1GtNtbsPFITR1JsV2knBW0f9HCYtXbMsB0eBglVtNm+0DmhdJvZGGDL4bVIhVvEwT4d74voV58+2GMTMfyTF0TLaFsg8rI8o+jOzxcEisxwEcvyV3aGQ/NZc11T0mVBDG5ghWpsP0dI7zRwqv7EGq48phy+nVf00WoHNsuzVTDxSr6RaRISykWJY0DZ68dgaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEdeOdv88oRlvWiBoGgfRM75RBqg4nmjmZCnACa+K7g=;
 b=gqN+MRSV9UVnk+T4Ka/fls2wn7tjFn4E3aNSYP/BZ4xhptivFDPeH1YidmZGDnEGri7XcfSEt2iFQ9ydmiQfHf5Nf3zl6Ucm1p1IHFNra2OgkkNw/Xnqf1xALgbpqrp/8DBcn/c131hF4f4pE+vtIvuywRtaJ+xsqS7Szu4lFfuOGQ6df3pmIQTPTez0kWoNl0RKfRHnabOMHFU9r9yG3w6iFoCPVejamGDbUjDzpuLHCNPh9ZIDLkVo/nmKOCisH/f1l9uT327bfNmjBya8MXfgGaWL0YKnNishPomKTY5Tzi0VD7GJeE/hRikGgfBbU3rOOgM73p2hLTyXQKUH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEdeOdv88oRlvWiBoGgfRM75RBqg4nmjmZCnACa+K7g=;
 b=DAjv/7cdMJL8D3UMiRI6NyIO5OmwfwzXZag4ZNJUbEIZsHodYm9Czyr5jIZVpY0rDKPxP197I29IOKlLS/n5Nuy21fphRIqbRJq+p5skHKSk3c2q9BBrmrlsdQpcfkMFbDW8c4s9XaNUdmrZs5yqYz7RLnmhAV/fzpeYj2FN9Q4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ0PR10MB4430.namprd10.prod.outlook.com (2603:10b6:a03:2d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Fri, 13 Jun
 2025 14:35:35 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:35:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 03/14] Test: remove unnecessary
 "unstable" tag
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-3-eugene.loh@oracle.com>
Emacs: the only text editor known to get indigestion.
Date: Fri, 13 Jun 2025 15:35:32 +0100
In-Reply-To: <20250522180118.27343-3-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:07 -0400")
Message-ID: <87jz5fd80b.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::16) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ0PR10MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be23a80-0c71-4608-9fe5-08ddaa878eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wjOyKFIQKIWGSV0oN7JVh22/XON5C8f5/P6ZvV3YcEVT/OoC5F9tKSkOPzrv?=
 =?us-ascii?Q?1dFXyHgZhvRoZLVA/3A2Z36yj/EJutiBKIIUUoroFsDIjbBbxOEo2RCvCsuG?=
 =?us-ascii?Q?tlWT7VKUWbCSJcw4ok0bCdAswj+4yw7XJ2zXgjswR8kWPCtOSpyP3dO1OlfV?=
 =?us-ascii?Q?1Wlza/sbs3ySC9tP4pK600NuAc+TGSmX2dHSqZCQuyK7KJmBskK4tBNOLwFI?=
 =?us-ascii?Q?n02TXSRFWRTWkOTjpnPyRrKujiCtp+2d5KnGmX6ViFfL9EkZc8DTReuh7OII?=
 =?us-ascii?Q?00pGHYBGtxs4g8JITq97zu4a2jIE0coWpjuWunHFRnM4rvM0pegDDET5ntwB?=
 =?us-ascii?Q?NALfTcwXmPqxfDh8kInnTEKQroOLlKDdJEpBB+8jlJKhS/C+3cFGxpHcDL99?=
 =?us-ascii?Q?u95+5U7FuO+60qGI/l5UHIzQYGSPsHhku/UwokZzj5C6mHx5naOlfUNQQtOi?=
 =?us-ascii?Q?6iyZLhVuPhSkyNG55me6rDxYNTtchLVWXWCACDX02WhWpbPLGFwl63ybLOY1?=
 =?us-ascii?Q?/fGhRWR9dtPBwpDSgK/CqZMB3QoYYSGxcCVhm/Rb4ZrdBLXYgI19KtDn6HeC?=
 =?us-ascii?Q?BMX+ffCA0ucugSs6x2jedEZjccG9wy6m499mSN0qsIE3yHqhKwVp4hFGQWyA?=
 =?us-ascii?Q?zdBtGV2I0cxweWMreAg7ctPCryTtMmT9wozPWHaJnCM1wR6GdGeHwnfW+Ejg?=
 =?us-ascii?Q?TcFPYu+yCWPchxDCM0fITVxoy5Fx8LP1V60tdzGGANdYUnUtTSmKwm9ZxBsN?=
 =?us-ascii?Q?/UPOKPFQR5RsB6PXhhgNhVOztDIEZolLgv/7zm2h7ntL3HdqguAJuUKTjpll?=
 =?us-ascii?Q?yzC9rV7rQ6GkDa/8DMt5VzZl9knVk0qVWUFjkVNMbvxNEYtEoXprhcWYum2m?=
 =?us-ascii?Q?8nguJdBscQZiGAYz3PEATtUWTa8txB2KBrN32KQD0gRYLsvP03DQsghf6MS/?=
 =?us-ascii?Q?jOUjsc7R5qJqlUgBefnW/3mt8eI8pbgBA6Yf500VemYMDPQb3ZHcnEwFx4ya?=
 =?us-ascii?Q?SDEd4igLkT0uOouIfshOfYY3uYWUAGnsmGzIK7KNAYNHck9k9AzNV6d0sOun?=
 =?us-ascii?Q?DjX6pr9FNLTaFXDx+Uipy/72ZrZLvGBFIibRCEDvOCPYnXnvmkL3HKv5ux39?=
 =?us-ascii?Q?MjhSoBrm5HNEoPLsDplPk/ewtC36GItUL5ViP1cEmZUtbKna3pkRQvUZ/0dV?=
 =?us-ascii?Q?ZgFSE/ZypXIr0aFFV6FOCT7uxN1L8AEtVtSgbaAbPKlsWF4VXarpvA1nDSER?=
 =?us-ascii?Q?WuYszmesz4PAlz2kYnp7jd7fpQEWuOX6/hZrLzFHDl/25hWxbAhO4ImqOgdT?=
 =?us-ascii?Q?yxgpFefjoDh9t3HozMnH2+fw4qWny4CIN5x8IScZXDSDe8eH93gGRJyooONy?=
 =?us-ascii?Q?ibS+QjQ02We7unJC+nImqFWSOWGNnwR1nU2VhXsifBAeFYe5RGpV4P5X+II1?=
 =?us-ascii?Q?bwH0srH1J2c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PSBiiVf9PmJR5zrzzIq4gyh8CijXcjGgqTwJkcECLtKLXNpb2RVIj9yTExIF?=
 =?us-ascii?Q?vt6NtIBh7XYgayA4yZY1dFtVZuDJPAQJ1LR1SDzFxhSakVVz1vmUCOtLiNuy?=
 =?us-ascii?Q?PDEkZAP7CTkIiMBQlioVgySJ7CSngrU0W/Kgi1QoLBSwElMavz5mfl/LZdo4?=
 =?us-ascii?Q?178feV61/zhT6NpPt0Ph7CG2JRcNL/SetIVMU4TrSLNWoOYT0UCmXgk6VB30?=
 =?us-ascii?Q?w3ZeyZ3ciFjaArXbnISHJhKI53VXS0GouTVlrOROBqKTsSe05lFobRX1c5cd?=
 =?us-ascii?Q?44DanlBscFHHAKhr2waG9bSbJhAFKbKqazETryHInJgPCy4y89VlNWUNSsGd?=
 =?us-ascii?Q?SKdGGcQS3j5coHHJMwSW7TgNMZb1WVAUMeZmINGKmSs+amvSp7LM21F9BVhQ?=
 =?us-ascii?Q?7mNOMvmBVxYDi8G3baHw71QDhjhye3eBzbNTMklEdEFzRFYBarsL7mwK+f8F?=
 =?us-ascii?Q?YLykm+bByAFhfAl0qUjSmYtf145rjqIIXz/kAZu14x/Y6+ZSrOb3sOIoQkkO?=
 =?us-ascii?Q?anmRGYGWvoDsFZM1tH3SaW7CSKsDw6ezE1ENL5NwJVdCR92/0poWxH3/0+B/?=
 =?us-ascii?Q?dx91MWqjSILQyX0TRxDgCb2RV0HzQpzqarMWO8usQJdxdToq0rCDBni8gRWP?=
 =?us-ascii?Q?RoX1DT6Op7JFxPk3DlwVKEAbvXLf7W1nYOijpfq/yqrBZt7pC1Fx9t5Z24Wo?=
 =?us-ascii?Q?4mNQ6XOBgxsGBIV9vKLEfNkxrVlrrxnPa64jmxd15aOMW0Q+x+oWUdghJ5Iz?=
 =?us-ascii?Q?Vfu53q9GJT3U0acIaEbSxBW+1MZZwI0mq8juzWvgD+SbuOZhUjxbT/wBQziG?=
 =?us-ascii?Q?GOogwRd0mBe+eMtYj3uQNeQRO1nzT7ankrBUsJvdlpoVuYu+XMWTcbDci1tI?=
 =?us-ascii?Q?Pi+B7EhqEvmNaqXX+W+na3k9klU7sTbJJj/toryniRbuhrT3zXgYLtWA0TTs?=
 =?us-ascii?Q?uCzghZN6hdIHmxLVLgG9Ryd7Z16aFsKlGQcnH6NJ0E3DMaiNwyVgm7z1bVCd?=
 =?us-ascii?Q?iJVHqWJH830+YkhtFiaYk7Vii+yimL0Uq0Zqz212OGnUZD5PLfGOfdpVyUTp?=
 =?us-ascii?Q?AAMwRzqB32H7Io8oGN6yALfhLoSEKLF+GoCOzXJ98Sus2pJtYoqlHyTeEoTA?=
 =?us-ascii?Q?M6u/l7zJllgyL2rm1jfSe54PsoW0wezbmq9kqWFCTBPZ/MDUM/O2qniGfpw8?=
 =?us-ascii?Q?b9rQOCGnVG4E3/I/PqbU/al6baXNgZpY/L6o5itdEytDk/9MaWYQQNL5Yk7G?=
 =?us-ascii?Q?Crj8hiOkK31TzwfI/0Eamn6wWxa3aoEsIYL3APpTNUWiaTqLUk04K1GRJk8H?=
 =?us-ascii?Q?EKWam/qzYIvL9X8Xu28QY9n5FmWayjZniYHDvY5IVT+eX1VPPLCRANK+EytL?=
 =?us-ascii?Q?1kTQ+RFUeIfq4dCxyd5cm4IssRslNjATi055jzwx3gQ8gUV0UkJMzyCiMjsg?=
 =?us-ascii?Q?INhBzDxKTFLAWVzyiXkzPtW4/iKqDTAe4Qh4kL9/+OSIxrF46Vq43vKAIrDE?=
 =?us-ascii?Q?bgchuB50/muvsBNsPNjztm9Vcqi0mkrBWw8/YCh86cbyrFbyqylwqlFBCN1Y?=
 =?us-ascii?Q?sGMUvnoFfjyYDZXoiVj047a7qhlo7psYkfJaZOyGajnIVHdPcAs9aU6bjlvS?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4wZ0m4qLeCoN7RhtcwoOZjPliFpL27YsNoMoH9Vn2GHL2J1BX6h30Uf1zgpwPkalU4heAimOCgjSjhDpF6GnFgmP1XGpaEttyYRZ3A3jiazrA8yoQ1P9NKZUHd2MSpNlsO92ewRiy+3c4QrzxiwdGX2KX6V8Md9r6uYuQ6S/9YgiGpBGNGw6okonHVUUmM5UFc6VXrtnDm76Tqh694i1bmJHdjncgOioSnkj1Ss+y4+IGmwgt+XgDITKKn1IuicvFDbtbqlUQLcFRYpWWaWgHtVJCkVB/6tdE4rAhMxWYxwphLdr6/J/kSXeFNktfbfQetSPDa/JXgOGx2aLA02N5O5sYl3laDemWavNdlOtjPjDWKYH7NH2J4ljreLcEIkuv6nLkzSdEBKBN1Pk7wkzc2nsrg5o8xm5G23Ln9dFR+lhF9ylKo4lVlTium7WYqpdkhFobvc0gthQ0kqJRcvSVLrs9K12UP0v94SfAErJKlCWeY6yIa+h6rwkKd+CFiFanDgm+lnkPM4GCsyRS3os4I1UM5dnUriREOaLJnMgV+6NJ4HzvnvxmPKEP7zj2g9qoL0B0JxYqxBqAoxFhnj8ih5+54Yr/BOq8+4tV1XkBz0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be23a80-0c71-4608-9fe5-08ddaa878eae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:35:34.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFlLFIRjoW8f8jy6Bfkfe2tRXQy2chAxkEMhFLhIIa1uEfuyqHdCR3Yb5gfeMCSi7QLXSRqOUq7syzP2Zz2IMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4430
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130106
X-Proofpoint-GUID: Xe64JhtPHs3Ek0Dq4fEgG2aWhQO-L055
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=684c373a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10 a=as4kufAtOCVNogPxCcYs:22
X-Proofpoint-ORIG-GUID: Xe64JhtPHs3Ek0Dq4fEgG2aWhQO-L055
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX2AE1M68eywFJ Kx9xUK0L1SuewE3W/Qo34w74siWaAMgTy1yn9CwG8JRVrmVMRGKZCHfUOqmraxZEJNxGwobmMoN 5SsX65SU+qElsyQm1XrJmLHtCsJiHZaiM4CFVoL/dvjmy7zRzMJVYevpL4BunIj73VacgQqPnm8
 TYMqdVSqr6JE+/wVClNrO+8/Oqto0XKsHkxS8d3JIg0Nm0U/cKE9K3Z0KWAFxRYJ010G+96Ejb+ ABltCL7xQysZ2FK7R/H9GJR4xAGi1nbxuaHFiu8RvHjZjKVVf2ABSvIPPCMLCCrl4QJomIjjG7v cbPYVjoaqIFpjUY8KsX2h0HBiDek8KEDh/R4HxcLyMhgLsxRRjGM7L5HFG0cRprAOjmgepKCIYD
 HF44MJgwiSwUrUnaM9/GKFKxZa4P+Ox/Lkl1+lTSHyW6xESXIvSTvES0MtATBFG6JsKNwR/D

On 22 May 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
