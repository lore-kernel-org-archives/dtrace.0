Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063318027
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728663852; cv=fail; b=Ykel1m9YVBUJGDGVkZV5pzAOQRI1egPaqPM5jwEL/6EsItM9zIaazsxyNZdyhPXebYloS6GmNf0YRl63+Qm2wkxOG4xMBkBfUjTH9qXD6wqnMXXl9gvPLu6FyYFWFnX37cf/behs84tIEQVohbCpxx2ENLhtYEL3eCgwtgwnUgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728663852; c=relaxed/simple;
	bh=PhoXdk1HnNMgCd7O2LPNmcwYsTinDVSFh8dGBzsLuTg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aVgWK9BNKXjDoy09KGYecjLNBkQvKqNqWVOcaLHyyeo63NUr+poKCc8S3GvlcLT1ZB3JQEbyrfYOcZvGfQYZrlhfdEKQmhYlK1H9P8YY75J/wdPolPFkXH12NH9+60eZWltWE5mQMYfoC0UetdDGNLOAaX2/BMCjSRpCTCqojHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QFTkZNO5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cAI0jpID; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QFTkZNO5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cAI0jpID"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BCpXAK029759
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=SdqZYoFWyZi7LBU7rSe6MbhIIdRiJL8chxLeOYzPRq0=; b=
	QFTkZNO5goenH+m3h3kuhWmQeAw/2UzyL+TzB+fznL9i12iI4P5mrj0nTUMsZ2K0
	yDCUl+60u79DozlgDAEtP9cYZwQeiaIkWLQxDC7jeaEXbogqa3NFtKFqhY5gFA77
	7x1q5fw0r41pygKKKgTIwcAE5tG56MOrXhxQXDTBg7GHKX8Co2Ir8wPcRFVOrrmU
	I10xmtRs+dYS9uBlMJyPnowc2d04jIu6MsFGVoW/ABFj6+09blj7DTitC3qIQ8tu
	G2MvZ9IWLAe6B6zX0EKyFyr7zkPftu/PA1h1IhOuzBzpHVaRLPT3yT2rAP10SXJP
	daExmJXPpQ7FMJ2UhwYQhw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dw72r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:24:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BGCbH5027914
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:24:01 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwht13v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 16:24:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5ZPHkortu+SJennSdqC6Kcro0cmFQnjO+pa8LloRY5MO8c3zuQ+R6rIzPY6tuJLV5umeO6ClPaQHD4xp83Da+4PHcfUUlKwGOX5F2bykkEBhXYrJtE9CfWk8LJ4/ILyi8j5slkhkIAf7zjh+LK69/mTlgDupDy6q6cJR4P5fQDoZzYHWlmVFhedvh2UQNQlks+ouO43aXLw1GY1B4zNhQk1AbhLtZEg5mNHbc+AXUy0Og0eshfjsGlBNWTUkUsRsbhm8WXbMb7QeYClAfMhD3N+PgHu7FSk6km6nnZD7vJ2MZKoua4NWtUYCUhPZ6Fqnxuo8uPYnX1ApJuk+dS9iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdqZYoFWyZi7LBU7rSe6MbhIIdRiJL8chxLeOYzPRq0=;
 b=GmJM59JSs00G7TPhLK2H+3LpeKsHRQ/2qjpNq3HN15M/d+R16A3NnFDaJmJzWdl2siQzDY/Sgknk4/ZjrR3TsX2LcxjolD4+ytVeOmDT3ZAS4LuqQEW1zJlM5QQI9Y+XmssRtGQR8UiPPA6aHF0pCaTALHtphxr9HDD5WY2DPIa1LOz/79m/DBKVs5+b4XGXBHMEH1W81k8PT7I8iqWq11d0tbl1Z3LIDCPp8yRslyE8OYsm1TzxDHnrognmd8NjI7c0KTlYxLO9pluFCSSKvNj5uhVf/hp8HFE/TgsdC5GkFZ3IuBBJiMpdpQmK0vSly/DFPQhAwfubY202yGtsbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdqZYoFWyZi7LBU7rSe6MbhIIdRiJL8chxLeOYzPRq0=;
 b=cAI0jpID8s2XtE9iv9WPtrhSOVhINxRha6xsl/AMyCTcvZl2OkdQQeemV+gvj/i778WHfF0r4nY3sAMb5hu7s11fMLfwhP75YkLtE0vDzS6H7LFHPczDGhQtx2/0nZNoNXUcypjv/xHf2nMcTTbXIwbh4aevOrVo0ks6Y3ArCIc=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by IA3PR10MB8092.namprd10.prod.outlook.com (2603:10b6:208:50d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Fri, 11 Oct
 2024 16:23:52 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8048.020; Fri, 11 Oct 2024
 16:23:52 +0000
Message-ID: <86bd5c9c-572a-40b4-b655-6c61ebdf1960@oracle.com>
Date: Fri, 11 Oct 2024 17:23:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 dtrace 1/3] fbt: support "."-suffixed functions for
 kprobes
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241011102810.989562-1-alan.maguire@oracle.com>
 <20241011102810.989562-2-alan.maguire@oracle.com>
 <Zwk9hzo9WEqrcKdp@kvh-deb-bpf.us.oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zwk9hzo9WEqrcKdp@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::19) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|IA3PR10MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 12b2c1d4-db0d-46f0-b9de-08dcea11180f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RklPcGEva0ljMnpGRnNqSWdydW9EeENSei9NVGduN1VpT1RHa1MwUk03U2l3?=
 =?utf-8?B?Nlo2NWQzNkM3YmgyYS8rL2JmcjZheHNySm1HOUVMTWhXdHlpUTlUeDY5VjRu?=
 =?utf-8?B?RWt3aWRFV21RV0tQZnBRWXZ3NlBrcVNtdElGRGt6Q3M2MjhhUzBRck5RUDk5?=
 =?utf-8?B?QVFGNUNhSjh4QmxSU25Rcmw5Umkyd2R2R2swQXgxTE42RjVpSlpSZXdQRW9s?=
 =?utf-8?B?bzROYXJJMFk0Qko0VkRpN1REVWtsRElvSm15aG1zcTR1SnNGbXo1NWgrN3ZR?=
 =?utf-8?B?WW5pbDV3L1RwTmVIc0FEZi9KWHN5c1hjaENtdmJ3OVhoSzJGUWFXNFBZWXhj?=
 =?utf-8?B?VmZmS2EwRjBpZlo5Q2VpUVdQQ0dlb2M0dVR4WFBLTFJqNGdlblJqSHRRcnFw?=
 =?utf-8?B?WVZ1bEFLK2dhczl1TnVXSkZXdkJ2YUd1MHM3NnJqaC9KL3AvNmw1MmZQUVY0?=
 =?utf-8?B?SXdyNW1scExHZUU0dVJsNE9OTmhGdXF4bUhaZXJweFQwbHdZSXdUMmxtMmUr?=
 =?utf-8?B?b29LZklYRjdTUzZHa3M1U2l0TU5IYmNKVHc5S2VWMDQ4ZldEV0RBYTc4cCsz?=
 =?utf-8?B?Mkg3RnRXWEtDQVlPNVRqalRsclFIQ0plZElZejhHZkJjbjhYWWtyU25rSUdB?=
 =?utf-8?B?emFrVkpkNVMwTU56ekxZd3cvTDVwdFhLQXRidk1NM0Q1TC9oWXBoMUdOSm9t?=
 =?utf-8?B?WmdwNGJyeGRmeHlnallDSWV2YjJUT2dSaHFid1ZHOUxNOXVXS2VkZWoyamIx?=
 =?utf-8?B?VU1BdVZHSFhDYkFPUk5tWmpGQWZVQjdsT1g2L1lGZXlLdmc5bWN1ckV4elFV?=
 =?utf-8?B?TlNMMVoyS3l0aW52UTZCUXlNVUNzZ2pXakY0ZktiTXJRaTNvTUhnbGE0TjhQ?=
 =?utf-8?B?WTlJVUVwQTJEcDJvRVA3VTlCbDFPTDZVTG9zMm1JeW5PdC85VzhZOXhVRW9U?=
 =?utf-8?B?WHRVcG8yVDNMK09ITURLRXh3YVRucXFjdUVrS3hVZkRuYlN5Vi82OVpMUy9v?=
 =?utf-8?B?dnpFcTFvcnZzNDVVa1ZDbjBwMW1iMHZUc1RhT0FtYWcxamxWT01VOGZEanYw?=
 =?utf-8?B?K2JuR0lld3RVZklmRWp6VS85eml1SEp5V3pnbGFzSjZ4QlNoSWxsZEliQmho?=
 =?utf-8?B?RCs2WFRJUUExMjBIeVoyVTVyeVBjM1V1eGMyaWdMVjM3ek9lb1lBYy9QamhF?=
 =?utf-8?B?R3B3UlFMU0FsemZVbmgweUpVMzRScllDSU0wbkV6eVhBWE1yM2Nza2lycUxQ?=
 =?utf-8?B?SCt4dHZEVjJUVXQwWUd0aER1SGhMTXpiZ2w1QlVueTlIcHpGUzNxVWxBV3U5?=
 =?utf-8?B?UkRvNFNwaWZPREF4bUZSOXphSUFEckhFU0Q0aVZ6ODBDT3dmZUllMGZBUm8z?=
 =?utf-8?B?a3YvSUJOZUVVYTBYejA0SkZCMU5iYzBZTkpvMi9aUjF4WHYvUkI4SXJZOENo?=
 =?utf-8?B?S2s4cU9VYmx2Um1SZ0xnalNrT3EyMVEySm9PQ2ZKS1pJRTdkK0pUU0ZUbDI2?=
 =?utf-8?B?SVA3TGNmY0kydis4UmFPeFpRUWloSzh0bmZRMXdDTEV0Rmd3UVQyWFlwWWh3?=
 =?utf-8?B?bTBYMUdqd2xSNUVNa1pTc0I2T1J2RXZCMHduL3N1OXVFSlY0a0t2YlMxeEZO?=
 =?utf-8?B?cmlEbUFERlVGMnYrME5HNlBWeVBQVUtZc3htQVpOZDE2ZUlKSlRvekEvZmpH?=
 =?utf-8?B?WS9MdUVNZnR1UXdrc1RqSTdHdUFabjVCbzRlY3ZrUktGckpKbURUOTBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MERrNXRHU1dwTHQ5M2JzdUhXUlBFMUQvcDB4emQ0T1FWQkpFWk9Pc0phVURB?=
 =?utf-8?B?Rm0xZ29sVGxWR3Ezc0Yyb2xhMFhaK2t5K2gzRXdWNkpudEdDb3MvOHd2ZUNM?=
 =?utf-8?B?YjllNjlYd1NmYjByWkxZb1FHNjgrN3lEZUZIS2Q0QVBRcVZsWEJPRVZKWW9S?=
 =?utf-8?B?cTlnWWV4VEJyT0RzTG83NW9YcDBVNkt3WjlvblVSYnk0K2Rpb1YwSkdnOWdp?=
 =?utf-8?B?TzQyaGgxZXptMmVpZXhadkYwdTJmUHUxK25BYkhHTC8rSmJmZlU5Q095aUY4?=
 =?utf-8?B?OEl3amlyTUlCTE5BVnU3bSttNCswM0ZYNTd3Tk80MGtUNWxQb0ZWYzg1QjVM?=
 =?utf-8?B?RlM2dUozaWN2NFYxSkpXcUY3RklGQ0tCYTFPNjdRVVNSZUxkOVhJRVhORjY0?=
 =?utf-8?B?TWtZdWM5a3psVlB0RkN1cDV0V1lPVXNGMWNKOExRalYyS21tYks0dW5PY2FK?=
 =?utf-8?B?emdlYVkzN2tza09KVjBNcTJITXp3UkF1RXhXZ0NnTGw0cmFVNmtxRTVLY04r?=
 =?utf-8?B?VDNraHFsMk5ESDhPWGFIZ2VMQWY1dTk4enVEZ3BlNWNyeTRsS1Y3RlZHd2V3?=
 =?utf-8?B?Nk5lcnRkMHU1emJrbWo5dXZyMVVDT0ErMW9CZE9IUlpFWkxmSTk1K0grMlZN?=
 =?utf-8?B?MXhHQzNxVXlxbnpSTTlPcHFMZEZOdGdMYW5OOVFCdmEySzdPa2VaM2haQ2RR?=
 =?utf-8?B?RVpSS29ySXl5UklNaU45NzNlTGZtTGhCT042V0Z5ZmR2OFVDZU04dHE5YThW?=
 =?utf-8?B?MWhIYWhubUtkS2xtVGMybDVBVlYrSWxXYTRaeXZ4eDljTzhkWkNwbEQzTHVZ?=
 =?utf-8?B?MkZJT0h5NUhIVHRxdHZzRG1UQytaWEhpU0pOS2cxRGV6M05XdUJGUnM3VnZJ?=
 =?utf-8?B?amlyb3pHbVZpNTFyQnlWMkhBRW9nRWV3MkhQTXJuaDRmbUxKT1pTcjc4OUYy?=
 =?utf-8?B?QkdQVUR2U0E1amg1UnBEVW9uSFUzcHhveHdMK3pLa0UvOFNOZVhJM1ZVbTls?=
 =?utf-8?B?RDlvVnhxWGlaQjdxdU9NcGZjWERCRHRnaU5qcEJ1WGg1TFdPTWpxTllnb1E5?=
 =?utf-8?B?QkZ1SkVTcm1tZmV3RDBkck8zYzE4SFRrdTEwOU9SVnhhMmJuKzNrNFhkSGJT?=
 =?utf-8?B?dTlvV3ArZHRpbCtmK2FQbThid2lUL3pmQ2lVYlM4dllJb2czaHRGcXl6ek1N?=
 =?utf-8?B?NjU1b0tNbDlMZmxxU0JqWmwxZjd6eXpkRXNFNytCUTZkOEtkdU9WWG9SdlYx?=
 =?utf-8?B?VUpuYzlrOGJVZGFQblhmNVJCdHlqT1JxNWsyYTNVRVZlaUJOVHhXYStBZWIr?=
 =?utf-8?B?Tmowb1dlUUpNVUdPME9SOC8rUGV6ZXMrS3QrVCtkWC8wWkU4L05DU1VBQm1P?=
 =?utf-8?B?Q3BvSzJCYWtNL213RHNkTkx0bE1yc0gvT1RLN2dxc2NMVkNQMUtyTUQxUU11?=
 =?utf-8?B?NkxlM2lVNDIxV05PSnMrSmxiOEpQcDkzWi9xQjFzbkFnaDNiV2xGL004cCtx?=
 =?utf-8?B?ZkowaW5IcUNjWlEyR1YrZGt6YURSSG1pTTV6NkhBTW5JYU5FSkhPTVhOc3BS?=
 =?utf-8?B?OTVKY1RNQXVZenhuNlltRlZZMmdCMG1tYng1SWhqUldSOStjT21RcGhRVnJF?=
 =?utf-8?B?NndPT3g5WmNlR0czNWlJZ2xkWk1mY3BEMkdiWE02Nm5qTEdlM3BVM2VlT3Y2?=
 =?utf-8?B?aTVMUDBwL3RQRzdxQTBJU0MrYVd5UWFoLzE5R2ZTWUdFSnE0KzFkUWozd3Qy?=
 =?utf-8?B?UW8zd0JuOFZFUkFhSU5NT1pDdWVObExjMWdzbTE4c1pnMm1CbkxjUGRTN0NW?=
 =?utf-8?B?dGw1NHFRV1ZMbGZieCtFN0VMT3Fvc3M4aFVqZ2NpUERxT2Rqb29RTWhjZG5Q?=
 =?utf-8?B?OFl5YVdBUHliVVR3MzVkY2NpM3c3alVuUDdjUFZlTzAyckw2VzQwalZCR2Z0?=
 =?utf-8?B?bUcwandPZG93WmhTb3hXQzFuQ1FiZk53S2gxZy9nZzlwbmxJUWlCR2FiL08y?=
 =?utf-8?B?M09FSnkrNi9RSUNhY3oyN09IeXFjU21sSTcvT3E3T0w3K0lVRDFNSnY1cVV5?=
 =?utf-8?B?UEtqZFlvYlpnMUNRc2h5OVI3SzF4VWtvbGFIRjVldzQ0ckVZRSs4U3hieEtC?=
 =?utf-8?B?cGhmUDlaOUJYRWlEUzJMZVZYVFNmZjJiZDNQbGxOTXExbGlnUmxvNm1sNFl3?=
 =?utf-8?Q?e1LBoOCBcVyPBEvsm05eQ8Y=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y9NGsyNOQ4qtm5sbyw1p+dwNZzun93rHNvrwdO4ys0R/yutk43FCv65JSm0wAWAfITqqeZ4VAx0Ez3fOMdVT9lLuaehqinYx/SDPNk6/ylFaBx6be5hxAvtvACojgkezNgzGLNClp++cdYKZK0InMquI5g6I8umknPZ2qnFOw58BdKL8I+KnCQYx+woX6uMtIepGvDjgepbDPiu/sQ1Iqp7nu5wrA8X//mKmk6wnkKZ4mHmxXfeN8NnvyIeXnEmytT3fhL8lo1tID0k06Czl0euc/QGjcpnX8mTuqeVpcw10PGdWHSvIKhtnk2Str7FQRQg84l/X3iGaQ2BYsnZ+5LV3ipjmR6fG3D2AIbyek/SEB0Wg3thbBDT/Gb8T0p2zpoJF3VV9NYhAlT71pUgclDJTPl9yC/vuxKVrS6iQaK9nx+R8yGnUhVOfI5O+3tnmtMFAFqFWrVhEwlX3xB3VgvYOimL3nOsyFCqYhHMFROyPLfBET5TPOOFX+thIriFRqMCNmc3u/s5HSBSc/3ZZ8K+vSf1mcgu3mhc7IkvA0prUuMQLRG033LmhOKjbyCBWfLnG1ZIb7ZbwVXnbxBoSqY0RpkKH/7cMjzFuXQmDacI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b2c1d4-db0d-46f0-b9de-08dcea11180f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 16:23:52.0554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNbdxkbLZVIUSUeMvbvP/cMn9vKC0GCsMy3+fbKx5dQRzN1Asl1hIuDphF1wVDDJS56lksryLmQlC2gY3hljsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8092
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_14,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410110114
X-Proofpoint-ORIG-GUID: fhFLX3jjuSZn6B7ejvfQfVfhlqxEkkow
X-Proofpoint-GUID: fhFLX3jjuSZn6B7ejvfQfVfhlqxEkkow

On 11/10/2024 16:00, Kris Van Hees wrote:
> On Fri, Oct 11, 2024 at 11:28:08AM +0100, Alan Maguire wrote:
>> gcc adds suffixes when it carries out optimizations, but often
>> these leave parameters to functions intact.  Many of these functions
>> (like finish_task_switch()) are important for tracing (and they
>> are present in available_filter_functions so are traceable) so it is
>> valuable to support probing them.  For kprobes, all that is needed
>> is to ensure that the event name does not contain a ".".
> 
> The challenge here is that not everything that is present in
> available_filter_functions is actually traceable.  I.e. anything with a
> compiler-optimization-generated name (*.*) cannot be traced with fprobes.
> Also, at least with older kernels, my testing has shown that not all that
> is listed in that file can even be traced with kprobes (probably due to a
> kernel bug that has since been fixed).

Yeah the results of wildcarding on all fbt functions are pretty varied
unfortunately. I wonder if there's a way we could come up with a test
and feed back the results upstream; maybe a few more functions just need
to be annotated notrace. Unfortunately it's such a fast-moving target..

The logic in this patch is coupled with that in the next in a way; so we
present fprobes for everything in available_filter_functions, and if any
probes are _used_ that do not have a BTF representation, we can then
fall back to kprobes. Previously I just added "."-suffixed functions as
kprobes initially, but that then raises the issue of intermixing of
kprobe- and fprobe-backed fbt at a clause.

> 
> This leaves us with an interesting challenge.  Since we prefer fprobes
> because they are faster (and give us argument type info), using the content
> of that file indiscriminately is not a good idea because it will cause us
> to list probes that cannot be used.  On the other hand, if probes with "."
> in their names *can* be probed using kprobe, then it would certainly be
> beneficial to make use of that.
> 
> Now, since the .-names are compiler generated we do not necessarily need to
> list those as probes.  We could just list the base function *if* we can
> determine (for FBT) which suffixes refer to variants that actually constitute
> a valid alternative (where function entry and return are valid representations
> of the original function).
>

Right, we could eliminate for example .cold. suffixes and .part.
suffixes as these do not represent function boundaries; we'd want to
keep .isra and .constprop as these do correspond to function boundaries.
As you say, after doing that, it might be better to represent the probe
to the user without the suffix, as this would mean they could trace the
function in a stable manner regardless of what the compiler did for a
specific kernel.

>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_prov_fbt.c | 31 +++++++++++++++++++++----------
>>  1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
>> index 21f63ddf..0ba0fb71 100644
>> --- a/libdtrace/dt_prov_fbt.c
>> +++ b/libdtrace/dt_prov_fbt.c
>> @@ -106,10 +106,6 @@ static int populate(dtrace_hdl_t *dtp)
>>  				p++;
>>  		}
>>  
>> -		/* Weed out synthetic symbol names (that are invalid). */
>> -		if (strchr(buf, '.') != NULL)
>> -			continue;
>> -
>>  #define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
>>  		/* Weed out __ftrace_invalid_address___* entries. */
>>  		if (strstarts(buf, "__ftrace_invalid_address__") ||
>> @@ -363,7 +359,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>  {
>>  	if (!dt_tp_probe_has_info(prp)) {
>> -		char	*fn;
>> +		char	*fn, *event, *s;
>>  		FILE	*f;
>>  		size_t	len;
>>  		int	fd, rc = -1;
>> @@ -376,22 +372,37 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>  		if (fd == -1)
>>  			return -ENOENT;
>>  
>> +		if (asprintf(&event, "%s", prp->desc->fun) < 0)
>> +			return -ENOMEM;
>> +		/* replace possible "." in event name as "." is not supported
>> +		 * in trace event names, and function could be named foo.isra.0
>> +		 */
>> +		for (s = strchr(event, '.'); s != NULL && *s != '\0'; s++) {
>> +			if (*s == '.')
>> +				*s = '_';
>> +		}
>> +
>>  		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
>>  			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
>> -			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
>> +			     FBT_GROUP_DATA, event, prp->desc->fun);
>>  		close(fd);
>> -		if (rc == -1)
>> +		if (rc == -1) {
>> +			free(event);
>>  			return -ENOENT;
>> +		}
>>  
>>  		/* create format file name */
>>  		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
>> -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
>> +			       EVENTSFS, FBT_GROUP_DATA, event) + 1;
>>  		fn = dt_alloc(dtp, len);
>> -		if (fn == NULL)
>> +		if (fn == NULL) {
>> +			free(event);
>>  			return -ENOENT;
>> +		}
>>  
>>  		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
>> -			 FBT_GROUP_DATA, prp->desc->fun);
>> +			 FBT_GROUP_DATA, event);
>> +		free(event);
>>  
>>  		/* open format file */
>>  		f = fopen(fn, "r");
>> -- 
>> 2.43.5
>>

