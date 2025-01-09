Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949318DF64
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736450520; cv=fail; b=j56XwAaXoAa9tFDvgFURJ6yrcLSk1Sj9lEkWMmFgsXlvDeBnTVb7hggGMrXBI5bzYTw24anTNKJnJJFHGEF4gyy4eVFIgDNzFhrAU11MTRcyF+5Gm8fTimmxPzni9orrMFFhIaQIr2ouhx97Hadvu9+h4uGZDxHaFsq+QlGuadE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736450520; c=relaxed/simple;
	bh=svwFbOMnDIvkEAg1EEjtQVxHDZFAY7kBF3/Nq8mpWoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HpvkHQnfbK5op/mCLywTB/dCTMvQWDKNnR7IgA4p9QjGX0VL3ZW+mudiTf0xbLEzd+QiSBuTIg3IljmQi23lsSiwA4fIXSPg9abDxO1uQhF4pmTOeTfZg4DF7E2SlbJ6O+y5XWHyQ4+MZV/vUsZQ/k5ikLdzCdWvp6Gr057hPUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LvZlgi7y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l7MgmWSe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LvZlgi7y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l7MgmWSe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GY4h6009832
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1TkXaoP6pxlk0TMBot
	hFJsWGKRGz+WfKefHr9FZ/Hf0=; b=LvZlgi7yRrxb2L5EKhFfci61Pce4LHw9lO
	NLnmIAjWK2Mpo8CitorWs7MrqFr6Oulhd+0LhJU4bP+OGc+mK0YsUU+VyRwyWrnd
	QVk0XhgPcyBPNk11kbAgHD84JOYTZNK1w1DwfMebtJcruYL/VtlC4VF0UlVNu3ij
	sW9dIcc5SLd2XYTk2IbU9/xJoTBkKEqBYatrFk4xMsJ/wVB90U6lUcCJDKeoJvgA
	4PnrzRZrUyZ1pYMc5TFfci/0XUu18upsvAILFnuBQqPrWrY7GcZlFA3/9K0/Jy41
	G6PREEvd+DMR1fvBdagCEBiA5KuQUQodamFb32xapRKjXTIRtfwA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xuwb9p6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:21:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509J0Sdo019970
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:21:56 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuehva05-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjhzvvNH+PlSI3GCmVORwEbLwLv8BpaR5/XeqXvQtVPmTV9ZLI7nBanaGQQMqAkUgzjz6hHUtc8d24EUijm0T3Leo6Yl8g8LAXEZg4kGLyhJp9Ss9TmFotJrz6vL8Qic8GqVO3/7MUqCAS1UsvyJgMFa4ev9+Au13CnZt5ebgb42e6a9X4BC0c/+4YTnRiBlJlPmAQ23GnOAWuXj1vCj0Tk/MP6/V1vWayirHJqcu8W9eN0guRY6o/qfa5MGhRCttbGuTlnCaXb0pi8U/b/370P8rX8Z5LXPsfTjk2OqwL++i1O8T4qNh2IyFgqsNkxlSIGP/1yt1MlxAKjKmJsmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TkXaoP6pxlk0TMBothFJsWGKRGz+WfKefHr9FZ/Hf0=;
 b=ss4/L2HAew2OY5lDwrV4x3L+c9phA4kmmZsdq4jNJVZgpIq6XZbRikd1IgYV7prmyQQ4RoihKpfwTR3we4ejmQUrH6ZPAlyCR+2b8FeODVQ+k0FOBLwenvqlX9TwxlWlZWzyNZe6j0yV/6evxAnVsxDDNh+ONNsGT1EgyvyboRWSj6zPFa5rXVFOhlaY3uZeEmI/+pdIJ0BVEzDZRfCMDUQGt1wmTHIQMyzG9Qbpbpzhs2LsNGK1loVynyFBLhIHb3grzelp2QFo+Q+Qr7eICS3WdILwMlG5uwbTOvCQGgpdKFHLe6VSYZrS/m1hDjkTV8Hq1FwK8ynGfo4W7wOU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TkXaoP6pxlk0TMBothFJsWGKRGz+WfKefHr9FZ/Hf0=;
 b=l7MgmWSeOrz5ikvzKhFwwtJM+IFnDh33I+Wrz12uXTqFM9YzzjWDfVrVCqUgdaDhZn+DH9OYxsIVSHLT8DTBE+i94YYwHj8ZIzh7gxFZjYmUwv0ZvdG65+ovVCfGhsLisByW1XDn/SMlXDTtjSVDIEqXsR59mCpsSiPIVBeHSqo=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA0PR10MB7601.namprd10.prod.outlook.com (2603:10b6:208:48e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 19:21:54 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 19:21:54 +0000
Date: Thu, 9 Jan 2025 14:21:51 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/6] Simplify references to dtp
Message-ID: <Z4Ahz5gjk+G79DTC@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220222716.18511-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA0PR10MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ca5ba9-2ffa-4d6e-9fd4-08dd30e2e02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P34uN43Eg6oe+jp5RMi0tFfBK6XszVsL01ZpIwEObfZ6c8XjXWbvmU7h23JY?=
 =?us-ascii?Q?mhFppzVTXbKUscSANKq2Z2LnY1J3hM2niSFn8Oh47eP6GQhDPbZGMbxfEk6y?=
 =?us-ascii?Q?LzuUhKr2sAt7/JTKdg4eJ15l1lEkXnMIYkswzrYbLvvKfZlwX6BqSUedk8eG?=
 =?us-ascii?Q?9PYvkUHYe257Td8rxSoqILywu4AbrgnK6e2lNx40AW6TikwMrJzQQbbm92+v?=
 =?us-ascii?Q?o3Yu6fLsg7sv4MYEcEEcPTQFSo3sucm/36bYf9QLyJfqDjXrJRi7P887Nmq2?=
 =?us-ascii?Q?sntl8Y+r3xPiNL40+R1MIxYflGx8wUU9oFbzUIiwg7JQzs0uR51M2Oue7tkD?=
 =?us-ascii?Q?bIaUlO0ifYjhRBoiRAZDCIebxdYst0MwP59j+yV/RJvZ5AKB73ZkJvviM710?=
 =?us-ascii?Q?JeiDjiS3L7+c0hut23qvGT/hEEDqfVcPF1N6/xw4u4nB0vpnGrvxWOU77ujN?=
 =?us-ascii?Q?2oUQRI7aqDn6EbBynb5batrkaYIzS3wr/ZvuiQZxETDKXNwL4ZF71vliTvk4?=
 =?us-ascii?Q?huJhh2Oy/veLdnKFpKimOgEQIJnu34xlb+Qxdl/ffj3Xz0t0BgokpBhPyIuv?=
 =?us-ascii?Q?+6SfPy5L1MS7JWDAV95LkatUpUjmyQZmCUIEvpy1abEY+6SuEZZqU390jdRx?=
 =?us-ascii?Q?DfyuvF50fPfXvBfbKWblhv1QBkt1CyiYQ/lmsNa1dP9vHwWnXBWUCo/dFkC3?=
 =?us-ascii?Q?ZAvEWrNP+H/RTpek8cS912o4ja5kzOsUofUm7YiqIS3p9H1RaulWC/+OdT7x?=
 =?us-ascii?Q?W3yxsZkh3UKmpqFU9sJY3i+rs1oHuzAr2o9eWDYsSF+KO8nC4yTo91dAPEeb?=
 =?us-ascii?Q?WweIBieAdPqNwGT3RBdmzjdKCAneh2tI7tczzQ2SBpSWT38NuADBbiV7uHLT?=
 =?us-ascii?Q?djq6xeULkA7ZnOKknKKgwrspFOIWRioF8EAd8n2a6qc9MDyV8zfsOazerY0M?=
 =?us-ascii?Q?5iCI2w33srV4Rzu3+VYicKHOzWYL36j+ZKQ0d/N7qu2QarE/GzOIBdcGfkYx?=
 =?us-ascii?Q?oby4Hwyv8/MAOTyWA5dDtYuuigeefOe678XIR/ePKGzdBx5OtqTdJ49CLCi0?=
 =?us-ascii?Q?lZWP5VHjN/MIPbH/Zld2bOBK1dMa34y3GBAdFGUGzCHw78PB+R+x0p0jPUSS?=
 =?us-ascii?Q?wi38XB5vXIfGecjXxoBqqbWQkyfpw+tAzHAHcqb+Li4pbyBog0SH/LAzF9+P?=
 =?us-ascii?Q?KvHUZaPDbA8R/UtCPNWHpMm4YVh/Csa3lOa+Nkxi66IXosJLLJW302/MUalO?=
 =?us-ascii?Q?vaWX4RRwnEaR3dPe48/hsJYTy7oCFGXm0unxAtmTfAMgCoCw2BFwe8Q+L2iO?=
 =?us-ascii?Q?PZyrvI+eJJjZ6h8+ied0oNJrLYmjDnxkRlr/TJUaj6jKBAAEIrDwrtUlYh/y?=
 =?us-ascii?Q?c9bSuyUEzdAgR+2A4Ba69XNh/SQj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2bIAHaG5ckLzOSvZpwj2Ys9bY3LWL/uOw8tqvkHdtTs0bBbJkRLKD2aCuEKk?=
 =?us-ascii?Q?i5w4dWYtSS4eL2PCzcark7veCs6+/iniO70VxmJDhsoMUsHGGh0n5dpBTqUA?=
 =?us-ascii?Q?/xwXe1nWB6C4fRMzYVs3YAU6uW6NbZSbKf8afY1MhTVN/d8ehnBF8TKxWs52?=
 =?us-ascii?Q?hw8NR3sninMm82dtZzOI/ktkO6pWA7DhiEszWZr2L/QNY68CUg6/VQG6IsX+?=
 =?us-ascii?Q?x4abnBitEOHJ9lDfuYzkZ257zbShG4w0b7vECOBe0pUn/REXkeBMOQjFBMVB?=
 =?us-ascii?Q?j7pGgW8mqMzvxvDgZUpklwhu6m/z0MP7RWgAmY5tflj3b+wTwcYbDAJ9ZCF6?=
 =?us-ascii?Q?VoQlDFw3JB9Mo9w2AXHvcC6jgiPVs4MTqFfHwabtilH00RNDnFwAziYR0tdH?=
 =?us-ascii?Q?6Rc+IUi3cIivf5VxyCMFUjrZRm/ymEqiJkYZ6fV4OZBJ3Iv3/HLjWB12AfJk?=
 =?us-ascii?Q?o1UOcMbD70dvTW2tYDYm5rnvWrxPqDMbYJESlz8vBLaOXlIGMKDBkoGfmmn+?=
 =?us-ascii?Q?eoC4tfFWN9iWze7EWqVu4DUp9gXSBV64M+wG1JOiyMCYmxNXCwUF9jl/63XE?=
 =?us-ascii?Q?jyRlZ1m0Ok9gxe40izyiG3v1WlzXRZjYNkkEbQJG3srINWpcwcI0mujikf16?=
 =?us-ascii?Q?Om3uhghC65ELwXmLRPH288glrSrTFVOQ21XlQnMUTEHg0YpcFySS2c+y63oo?=
 =?us-ascii?Q?A8ZzXPVRptAR0Ib54ocbf/j7mcv3SSmMGnq0aZiVpv/O0BWOO0uvEGpcclyc?=
 =?us-ascii?Q?Rg73M6LDKcRz01/2zUWov3KBX4Ln+mLV7n+m6iw21OYgRegQdYq17UFyrfSr?=
 =?us-ascii?Q?PPeis78UFkAMqHDIakBbnnvk0euDcMsH/oUE0s8ollSIR6kBi40vnk+XNJuv?=
 =?us-ascii?Q?6UK0au1NkZc/aknAkRL39f5qsPzkSehHUub60UZsDIIx50HVFOqbTvqE9DJ3?=
 =?us-ascii?Q?5OdkzO76zn0eZRRlWPLSj39xAy/nLWRcZFfw9x7k0brP4NO0TJAryXb2TA+j?=
 =?us-ascii?Q?0np5tXW0eEu4Ww+tFBXvJSI0dWrs/poB7KHF/G1/5uKSYpr/QGR352zvs0vH?=
 =?us-ascii?Q?Hp3RPM+C9QSh/NhR7BZiOLL0a6IQpM0Oi+MB0EiQL2KsuTbkv8NJ2wNfDTp7?=
 =?us-ascii?Q?VS/xIbFSXl1HukvVyFfZk5yDGj7GqyXOjbRyngReRUiWmBKPd9vYxVKqDJXR?=
 =?us-ascii?Q?Z4a7Lrd5Kv7YUIGZVfTeF6roykI7Himej0YJpmjP/W5tadp47IKF2fSpwzwX?=
 =?us-ascii?Q?EEqoopz0bSqlKceIKCt/CMKpoN0MYcKYfpy12dhfMJRZ45rtxNC8byC6I8W2?=
 =?us-ascii?Q?HmZB3yNwDt3tlvXauEGjVP3J8zvwYrPakqYfg7Tv65mktrzRdXJMou+s6ueL?=
 =?us-ascii?Q?i2t6gTZW6EuDE1EGZ7MVq2DnqT24EFT4RR7BPRR8LYAMTrUiQYiB/Ckl4ZWF?=
 =?us-ascii?Q?avnjfGOur+ooBWuGg+zIR4JCCY3cD15y97Ic29DjRzN/IUphpfcWTzfOMXhu?=
 =?us-ascii?Q?j850l+lDf5BtaUWKgTVr80WjNvJIWYCR4hywGnZtpai9a2SfEOKyLVIpGsiJ?=
 =?us-ascii?Q?WXLUSTmrtt495/QvDRTWUnneziaTK2SQrYQkvNp7fD7Ur7yGIS9d4wTW6tat?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NylNlyC0j9gE5iRH0je18Lnp1gLAstG38TsHgqqFrSE4gXvM4aOMt76HLgFbsDxzuPM/6n9jsorI2WF06fzLOudaOtrzWctRXJDCjqYTkYwoj3Ot29wuDL/nghXKqB7MYPxVXzgiYPL5NbGizXW4CCI9vIDBilbQafKvzSno+WYOOqf9BQCv1x0eL31mN/dOpqtw1eokS7yxzIYeOR4dnaT/O4QnedwN+nbkazjMaP7FfNse7bp/jHUclr6epGpgWsAWVFmaGsr7VdqzOCCYXPnphs0e198ywr7l/ETJZLyMlBBpcRwNgTxRGE7V88p9+qFsxCEtFssGChyIIN57TJtn2oHE+YWNSyVDAbk5kSEbJghYioNlkIzSGP2gnQSzx88CSKBozhY2P7Df5LoZsGKAcgXuM7cT32nYx2X0sfIDVh3U0U/ejj4HQf3hsGXBGqB3gkG8l8r3PTMCkrQFhhjvvGqAqZkoI5OvUgHaKhJGTwKPZDDNO5PEi1v3jgf1oGJWApy8C+OlhryN214iWG2dO238nflY4IbeK3hlJJQQv3HD0AmIoX6fW0OvtMLswYESlpBLI9SITRJgLPUqEiUIOAvjEnVhZmhuYEcYa0E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ca5ba9-2ffa-4d6e-9fd4-08dd30e2e02e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:21:53.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mf9qdWPghWV7o1BBsTG8GeHfaJAK53RFkwhUKSjXhIvPLvqAY17GrfqDwCq+IemnSK84/KVlRSpPMdtEi2yssQfbnR5Pym5Xr1DkNc417eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7601
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_09,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090153
X-Proofpoint-GUID: Zu8HkpUMsS5vJsmX3HfJweP4_plXLtZ5
X-Proofpoint-ORIG-GUID: Zu8HkpUMsS5vJsmX3HfJweP4_plXLtZ5

On Fri, Dec 20, 2024 at 05:27:13PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 27cd7d13f..e57478450 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -231,7 +231,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  
>  		psp->pps_nameoff = off;
>  		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
> -		if (dt_pid_create_one_probe(pp->dpp_pr, pp->dpp_dtp,
> +		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
>  					psp, symp, DTPPT_OFFSETS) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> @@ -362,7 +362,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  
>  			psp->pps_nameoff = off;
>  			psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
> -			if (dt_pid_create_one_probe(pp->dpp_pr, pp->dpp_dtp,
> +			if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
>  						psp, symp, DTPPT_OFFSETS) >= 0)
>  				nmatches++;
>  		}
> @@ -434,7 +434,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>  	if (obj == NULL)
>  		return 0;
>  
> -	dt_Plmid(pp->dpp_dtp, pid, pmp->pr_vaddr, &pp->dpp_lmid);
> +	dt_Plmid(dtp, pid, pmp->pr_vaddr, &pp->dpp_lmid);
>  
>  	pp->dpp_dev = pmp->pr_dev;
>  	pp->dpp_inum = pmp->pr_inum;
> @@ -466,7 +466,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>  		 * just fail silently in the hopes that some other object will
>  		 * contain the desired symbol.
>  		 */
> -		if (dt_Pxlookup_by_name(pp->dpp_dtp, pid, pp->dpp_lmid, obj,
> +		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
>  					pp->dpp_func, &sym, NULL) != 0) {
>  			if (strcmp("-", pp->dpp_func) == 0) {
>  				sym.st_name = 0;
> @@ -496,17 +496,17 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>  		 * dynamically rewritten, and, so, inherently dicey to
>  		 * instrument.
>  		 */
> -		if (dt_Pwritable_mapping(pp->dpp_dtp, pid, sym.st_value))
> +		if (dt_Pwritable_mapping(dtp, pid, sym.st_value))
>  			return 0;
>  // FIXME:  why are we changing to a spelling that differs from what the user asked for?
> -		dt_Plookup_by_addr(pp->dpp_dtp, pid, sym.st_value,
> +		dt_Plookup_by_addr(dtp, pid, sym.st_value,
>  				   &pp->dpp_func, &sym);
>  
>  		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
>  	} else {
>  		uint_t nmatches = pp->dpp_nmatches;
>  
> -		if (dt_Psymbol_iter_by_addr(pp->dpp_dtp, pid, obj, PR_SYMTAB,
> +		if (dt_Psymbol_iter_by_addr(dtp, pid, obj, PR_SYMTAB,
>  					    BIND_ANY | TYPE_FUNC,
>  					    dt_pid_sym_filt, pp) == 1)
>  			return 1;
> @@ -516,8 +516,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>  			 * If we didn't match anything in the PR_SYMTAB, try
>  			 * the PR_DYNSYM.
>  			 */
> -			if (dt_Psymbol_iter_by_addr(
> -					pp->dpp_dtp, pid, obj,
> +			if (dt_Psymbol_iter_by_addr(dtp, pid, obj,
>  					PR_DYNSYM, BIND_ANY | TYPE_FUNC,
>  					dt_pid_sym_filt, pp) == 1)
>  				return 1;
> -- 
> 2.43.5
> 
