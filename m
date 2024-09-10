Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274ED1A706C
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725993487; cv=fail; b=MVVoUwib+DSI4k3hrSRd5keyc73P+N7O0I/aZJFOVYU5ZNa3+BO2YFuVucUPdWU3PTY4va9fuZHDpT/imfGfzX9Q0N5e+fbfjC3nsGg1f9yV/5fBHcdh7zZeTyXZWHi81KwvGUMUYEzySuFyMahw54+Jhe3jJYeXcWDKiI374KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725993487; c=relaxed/simple;
	bh=B/d3Z3Wl1STvLO4VwAlKQai9xE28VQ9nV5kJX1jVfiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dNUapDxKS4xkqkbhZ9e+IsypU1bMBaBVYogoY4Wa9inZ1yY1nup8uJuH+0CrO+UkjFmTjZrnINqi9QJbyqg8X3uZURF6wBL1RQjANRu4Vr9LOc+D4+7x0guqqZsDQ95V0VN0TjOx8wQpn6gZOmj86Ggyh6PJl+qAhRa86Lvn3cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Axpg6NYR; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J50nHNYb reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Axpg6NYR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J50nHNYb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AHNe1H009378
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 18:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=9Raiu6fyrMGSqCYI09MdYV1jlweiDtnsG/Zcw8EPXiw=; b=
	Axpg6NYRu0Cpf7ZPH1/u7+BUuKv66MxN9bw3KiU+llSbsE3f3dcDNcZ6bBNi6GjA
	3rXFo7H6uNTOKW8ByqVBmMNm6jynJFz9yYc8gIrlPsPEKXZJGbW4OHCNQkcWCDVl
	vcvchNqyxZ1SEudnzP8s+LJYirSPO1F1DuMcgW+877ytR562N/no/iuJQ6GPe2fJ
	zi8QQN544Yva+BJmRuv7uHtpwDD8nZhJKIt2ED3uA06jGSoN6k0nIyvsfjYtNzo2
	6P+ntNQ5yKBdZ0APebzY4sk6N3jZSewL4VzInajnMgWTuzuznydpUfjsiLV/3WAk
	+a+42PYEB54/uAbrT2dvCQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gfctede2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 18:38:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48AICdAN004967
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 18:38:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9906s5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 18:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqHXWxiE/xoZIh/eVRJxxyeDkAbDOhMoT4WqpzILICVFE86olUiTCxGm4EOoZ7SiJUc8NzKFfFNGO3Z2tgCPxg/oK8ym8nZ2QZWim8TRwy5bbz5z4L2ao0zl81i0ZD2drzL8Snw3OXjL8yy6QRaocgORjUwAf2+IiDjAtKzeT9IEa7M/1xCTc/4caBaSyyhq28LmTcVGeKrBPki1RNQWeeJ2qOjU8CupS9ry8GBtkc8cv4QYq0s3ca+cuTFGtSU+9AWuxiJ0ffWEVEk0fbPT9lZD59aR4wmL5sYrmIQXo7zM7SoKM4PTVfSwTfAzWsnPcgSZMR3xzYA+g2BniZjGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0VhhcHX6QHcL/mwt9w5yxMXdWhtZtD2kN6Mqh7GFSY=;
 b=Euvg8ZlaOJPqPaYnH/CdoIWtChE4ddKUAJCZ6C+k/Il9frdC5ZSF9gk0qlZHjDvDg9+yX1JL9wkYJFU0yJqhJYytavUA26rdOl3TIomVp3JUxjW9R0E7eKprkKeTo/OX3f10c7rRiZr+uxg9l4T4OpgiK8Rkdmf13i/7X3VNO56dXQB8T1WUxBedKuBNkZlyAwrNcjHQ60kGpFaZVJSYDgSwe3JpOvSXDxTFNyeyO70vQZtjRqUkCo8i/JEkapdFUDUjVWkquvnbXT0HccawTUlr8h9jiJ/l2QB3e0PlWWXp+QN0ThcgyqUZDgLkeeYTRd7fDzZiIx9xy2ssV8yPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0VhhcHX6QHcL/mwt9w5yxMXdWhtZtD2kN6Mqh7GFSY=;
 b=J50nHNYbbrQ3vZ1MLWLq0VoMo7FcF55iWuktkT/hvgGZLUwwYDWb6zvmKt9LCBpyOn+DdkOdfx19EmixLecNVlfwJHSwVyVzTeD+dnznenn92mtebG6ZFZh4TkhEG5eELP5em2bUArefiF0s0CozEN4Q8t+0PDApI46BFQhAdyc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB5549.namprd10.prod.outlook.com (2603:10b6:a03:3d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.16; Tue, 10 Sep
 2024 18:38:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Tue, 10 Sep 2024
 18:37:59 +0000
Date: Tue, 10 Sep 2024 14:37:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Message-ID: <ZuCSBGivnCyaOszb@oracle.com>
References: <SN7PR10MB6287064DED46D0F4E2F055D2C29A2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <65f82c4f-e826-2f66-2ff5-b38bea4de817@oracle.com>
 <Zt/lE5Ye0q+wOE8K@oracle.com>
 <32dc5af3-7f07-5172-b7c5-9a9dfcceb5a1@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32dc5af3-7f07-5172-b7c5-9a9dfcceb5a1@oracle.com>
X-ClientProxiedBy: YT3PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: c3fcb06c-fcc7-44a0-8b96-08dcd1c7b1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aaEGOoso1EHIaXJ4RpX4AHD1WIHxNMhNTjgQaMq72Um6/4ZeKxrmdgXxag?=
 =?iso-8859-1?Q?AAwtoFCPIXoxX2CxSGeJ1YyYYxHqvvC/JS5b9DMcpOwclsWN+cnYMyLNni?=
 =?iso-8859-1?Q?12Ya4ApTDByyQlU7AmJvph70sPLs+e6XIyxBy7/lxjoi62VHTdggW+F9nG?=
 =?iso-8859-1?Q?hdZ4nVr/5RwuTv+j1j/NGoet8PXEHb1ZG2BlixDvsYoqFlNtbII5SXSnd8?=
 =?iso-8859-1?Q?YZj9zXw9wrrWT59JqlA1HeEy+oR9lH1MHaJj000Am8ZBxvQyjIhxCVVyTC?=
 =?iso-8859-1?Q?KPdaf+X/vW8IYRtS9n9Ulxyjl+1LTG/PdF2RM04LrOE0uAOXkENmI22ZK+?=
 =?iso-8859-1?Q?PcB9tV1C8Dbg6J7Qv/O+hWBDB7fdxhNMhcVNtsDkDfOM8NFDouPCeGMEaA?=
 =?iso-8859-1?Q?K5+C3HIfjB2rBQ1gCKReTz1WtaWGlHiSdfCKWAF1JkDoTOpmgUfywCtJVs?=
 =?iso-8859-1?Q?eP/yeiPk/5ylNRVOuJuYto2sXH/VFpXy5RMWaT2Pc/RcqM1UZsJ/j7ltWU?=
 =?iso-8859-1?Q?GAcY59lDOU041FNBgvRsy2V9Vj3a+EBvsTy+iQJFD5IdoIrvCvWsWmDiX4?=
 =?iso-8859-1?Q?Bbr9W3A+ZSplCxxt9IRROwJy9kw/YlnRGcVFcE+skTZX5ti5oKj6kgpyXm?=
 =?iso-8859-1?Q?te52YwDqzB8E00L1FetS6x4GpHrB5ikjcIQprDYvRv6UKHvA/YLokLJWlw?=
 =?iso-8859-1?Q?lZOTAY5gj0syJQgr+TkDxKtSBfNB+eHAQ7SohAY/7CMCMkp0pD6ZkcV1Xf?=
 =?iso-8859-1?Q?N/RM/OVwFN/0GSlt0fjwHXuH5eJPOPEpgkAcHLiVJg45E0IJkrYDDBxJ4U?=
 =?iso-8859-1?Q?rp67tlay598XZVGIdLFZR4F3jZyNsz4T0+3Bwa6ylaHBXUNcflFZHdYgx/?=
 =?iso-8859-1?Q?yWcZktIPaPXgUEUINsnMVX/wNyp0pombRHoT4lChAz3998XRV/b+27e3GJ?=
 =?iso-8859-1?Q?SAFFuPCJLirEYZHc6v0k1yeGKvrrwaffG5PmFlZxylQxfLRyIxhwCEyo2n?=
 =?iso-8859-1?Q?179mLnnvDgUm+4E08PFNheiSSKXxFzGZQRr0MqREaWmy3fxHP8jQ8fvHTs?=
 =?iso-8859-1?Q?e2aYVZUfN23iCd7Lliql5VkAPvJWJiEhE3LbEkKCY5m32aZldFY325AZP/?=
 =?iso-8859-1?Q?H/9ZkjjQr/HK4bzeUb5pAFG35TImxEAn3MMUqovo4IM5c1FvjoejkyooJJ?=
 =?iso-8859-1?Q?Zn1QW5wx/6eSvpfORbnjXrnFfmkGnOzzoZEq3f+8plpGG6437AU/xRK8+E?=
 =?iso-8859-1?Q?aC7y6aibi88YWIq9fQuFTmwhP2qYkwmfs1VKNAFNLthpq/WQuBgeGt48AP?=
 =?iso-8859-1?Q?ZJ6HAqajx0is5FoBE0oSpu9yq1xwHLMcsARVO9Cd5YxfRHeQ6tl17RwEQi?=
 =?iso-8859-1?Q?B3GFDBnSkTIkWox+TpOcSKkeL8tprqiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?1oKQaxtfFQK2rl5qwqaYvgpp1wmWCtvBc27jboa5CLGlFHtyyDe1TajgrS?=
 =?iso-8859-1?Q?FH41g/u5PC1Xam7TZh0RPuN9CtfcxQaWFYpe8f6e2+gDNXE2kBeNAI6Buk?=
 =?iso-8859-1?Q?xrCDy1Fj6e0SPIj6hfjnR3D538kmkw9Pwce4g8DoR8kMbDHMKIK/RAmoGB?=
 =?iso-8859-1?Q?l7E1iAmd6ZSujwgDfQA9jB2/GTt1Z5oQM+athqzxKH32I8wBzyeJ4ZY4gs?=
 =?iso-8859-1?Q?n4txCayAVahzQj72DlmF3lWkQYa6JgyBuGcUS5si8WAVV8xUPUegCOGl76?=
 =?iso-8859-1?Q?URvsfq16yWagsVacRHHNVxYaXFkISZqDwJZ0NpAOEKgEnICQs1Qdansbi7?=
 =?iso-8859-1?Q?9Ts3WhCdDkgORe59WeanJbCiYqacU9vgQHxg/yb2BGF8fDhw99ZvOdg0KN?=
 =?iso-8859-1?Q?QMnUAN1pf3LI6tvfkeiLb8UAwM2bCXBqxKsD+doOtKnnKjWK+XWnQwh2qt?=
 =?iso-8859-1?Q?kYchBj8WMHogh1nkSt60Dh8jzgjn1x/tIxnWrsGo5ZhLT5oD0XzGpPQsZc?=
 =?iso-8859-1?Q?gjfQ/vP9PnDih38Ai29YT71s+5EysgwfZ4ixQm6AAdA78RaB3Z9YQ3I/WA?=
 =?iso-8859-1?Q?U1qGWfizdBHjomzFq6e2CKkoe1P9suQ2FA18osGnpgmUBgG9zjXqRHTYFj?=
 =?iso-8859-1?Q?JNQqcgka9dT3VIizWlNWY3q6bTuAaUWAWOA3Tdbbfz/W1lwO1QeF5sF0yk?=
 =?iso-8859-1?Q?PhZjd4Ol+CSQLiRgLPldFBSDzeaBrEDn1NGsArv5J5ibe0KMcuuHzS/A0D?=
 =?iso-8859-1?Q?yjiSmAlgO/IYSmLbLv46RT/UW1StMIZyrptOAWH08fsm+C/lZXwcDI4AOh?=
 =?iso-8859-1?Q?4mj/A+vzSjONNLV5+SRmPYV6YootrQqxqRtP7FmNtexhNv0kIKL7B6Up/v?=
 =?iso-8859-1?Q?jgZSdjUW6aEDIZlIBEO2+4KWSPJXx6KNBIvjjQHenFE1z8uQ2u9Fp/Tz7F?=
 =?iso-8859-1?Q?PHEMLO3qJUKvY2zHQCkNNmgglQdREgvUTtsLo8QqGQz/gD20YCfK39oP/x?=
 =?iso-8859-1?Q?U8nwQWQN9yeW9vHeLVdRxq+zf+7oT4yFbCV6iMUtl1vqB1/lRE0+rz23ga?=
 =?iso-8859-1?Q?S8xNSEza2Tj3ik1w+8QsVvjyz+5IX0+G+rSwqWghwUm6t25OROHtxLaj/E?=
 =?iso-8859-1?Q?yQxTewMQT1JP00uhbBLM/PiX0gueD0cePAsnL+aVCQh0KkFd0+wdHTAm9z?=
 =?iso-8859-1?Q?+qKHIlxWsKllsjftQaf4iP+NatBWkQnAWQAeCr5+TbUiFpC3KkqX/8w357?=
 =?iso-8859-1?Q?kk+UudIt/IIvGqQe1uitiXMMbNScRRGS5nFibhySoJHqnbrWO/6joICk6S?=
 =?iso-8859-1?Q?7MhbM5YqT3whzBCJOa6mz9fQsHPzoOgPK6dYRDJ7so4kwlnKIu0CcR/eGU?=
 =?iso-8859-1?Q?HIJkgDoL8+XRLOgYvM+VNcg6Cdm2yKTqziluTE7TfoBDm4JsFi2BNAms+Y?=
 =?iso-8859-1?Q?6sgFuv/8KOWVq/bk9Ec5dql2EGkGOBDghdekso2bomoY9F7v7YxwtwdJ7Z?=
 =?iso-8859-1?Q?90GBuA/HPG5SBgA3BdLzC7MTiGyiXRFMZeB7PREDjt9n2PfO0OObNYYXV0?=
 =?iso-8859-1?Q?Dr4dc6fcHHdI5aIi2yQ/zbuZEwquyQrIDQCq44zJ2beD/73t0Uc8wZcWEr?=
 =?iso-8859-1?Q?ITxLrlQTLw2pRNXK/ZAQUbmMyfKa5qx+dGqAvDxEV3HoZjBsfeB9XUyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9ZwGfBjNuNaNgoPSKIRmrtEaMnPjJPglfiVvDNebBBm8pLK1a7djJ4Zhz8jGAHUu4NmkMmsIwObcmVt/m18gbLC+gq3luYOmElD0RQXISSGtyY+usU5qbLTDn1FD9Ky7zl43uv9esCPoSD1LBiK08ZS05Xs3aCxHSlmhj3evfXF4PQYfnzpWXjBdL5hm7sVKMp3cXX66RyqQ7vtmb1j5utmcKVSBwa1YF56WizsABXCzD/wjatXMTXcRhzWdPeJP6DmnyzlmYRkOD7gP8y3DZpDAOKDGufODWGPdi9QgFJMzFqx3+fwnlBt0RCqiE1OIYcSMZ6dDjANk3T2YYFJTCtlX8YJrOx7pE94B/vHZmtsHE1jiDtf+t/2+uJlkHJnLLg6ZYowVTQbF2W7XiDmQ98+LLL4Mt1X5I4QgoifK7Ny+mVOXljG0hXq14rOLJc8vQQfLHdRKmoP55+xz8CvLIdGnhOElDSfyH/145lqHE6mnsNEtbHrOIYu94CYAmuSkm7k6eDDsivWX7I+UGBzwU+3ej2fsJNy7HEseAimwzWoSm3+tvYApvTazIp1/FgK6AGYbFcQVRcJOYkzB/WrUR60x7HyYjuMdJykHknvnRX8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3fcb06c-fcc7-44a0-8b96-08dcd1c7b1c1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:37:59.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shqrXfrEeT5SzxMTkp7lA7zsUXpdG23y3DyDuJcVJELiAW3l7pw7zBAIygs3AEnL51ERFKRrOOD9Sl2BWt+vIpG2JuetkrfcV8mUU0ah3UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_06,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409100138
X-Proofpoint-GUID: Ky2ZfbtmKMQjuWXJ5kLYCVgMw3xJhHmy
X-Proofpoint-ORIG-GUID: Ky2ZfbtmKMQjuWXJ5kLYCVgMw3xJhHmy

On Tue, Sep 10, 2024 at 11:20:28AM -0400, Eugene Loh wrote:
> On 9/10/24 02:20, Kris Van Hees wrote:
> 
> > On Tue, Sep 10, 2024 at 01:51:41AM -0400, Eugene Loh wrote:
> > > On 9/10/24 00:33, Kris Van Hees wrote:
> > > > diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> > > > @@ -31,6 +31,7 @@ typedef struct dt_mstate {
> > > >    	dt_pt_regs	regs;		/* CPU registers */
> > > >    	uint64_t	argv[10];	/* Probe arguments */
> > > >    	uint64_t	saved_argv[10];	/* Saved probe arguments */
> > > > +	uint64_t	error_argv[6];	/* ERROR probe saved arguments */
> > > I don't think such a thing is needed in mstate.  It suffices to use local
> > > storage in dt_probe_error(), which is probably what you really meant to do.
> > > Plus, calling it error_argv[] is misleading since these are the args that
> > > you are *NOT* using for the ERROR probe.
> > No, because that makes the stack too large and then the BPF verifier rejects
> > the program.
> 
> Just to be clear, do you mean the test program will fail?  Or the test
> program passes, but you simply do not want to add to stack pressure?

No, the test program will not fail with argv[] in dt_probe_error(), but other
tests *do* fail if we store the arguments on the stack.
