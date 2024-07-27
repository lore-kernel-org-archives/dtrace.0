Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC1A394
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722043311; cv=fail; b=eEw7gtkNDAs6iVFzFTZQGj3/a/NgWw3BFBFSIlzyq8Y50PJm5cV6YiM4HdqekIp01p52xnt9TTPto1E8LZZvlnYEdR2LKk93plbs9hmXnw/97oj6c71eM1LVFFyA6m0j/q5Mqht2gyPaCyGil5tASSdiUgAeT12f79JQ8DqBoN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722043311; c=relaxed/simple;
	bh=bOcVyRNx3YIEyPykMZD0rH1+VglDFwN6E/HM4Clsr2g=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pkA4HD/R+IXYTRFG3uqs+jQdxxHi4tgj1vWqMZOS1ehsdJ7uyWvUIhjasOxoT8X3hhZp6vtCJ87T7Fs8INLAyrqxyvShggdMuDViFC7GpYctuRVrm3SbFc4xkFeOQYGUF3DmWBad/SYcVUj78ctj440Ev0Gn21SK5wJa4Jw1JMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gfVH4nKM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i6fb8e6p; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gfVH4nKM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i6fb8e6p"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46R0lu5j010642
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=XiIN8mrMkK/+cetf5oGWuZz78MzLkorbln2bf0jwuQ0=; b=
	gfVH4nKMH+xpXR72hiTIftzNm3itBL132qAn+CgysRrKolteJADePWsJkQOsdau7
	DxS6sp0XlD4nfzVocUg4+hCrOvbI+Un2HYWkbTTYHJY/0+ragKwBJ74YBYqOXZ3q
	xwR8pacE8nBC/3ACud2j0oTDDC/xhBNIy7reYZbKpTCwSoD5/Sx8lITyblenMX6X
	kwjdFqLqVsD0BETHZGMXva+/LCIEIA6Two8gReLVyBTZp4E4G7w9nGqApqUommId
	HrhqBgSE0Ezg9wo9OKp7T5Nrr2DFQaNv2mYqcE21aTjnG0ZcOAfzaFtwWuSPlmj9
	L+zc6UHJq89+4vlhTRquZw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mpn3g0jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:21:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46R19EMa039007
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:21:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29w3eb6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 27 Jul 2024 01:21:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DS0gvEc38/0WzeS2WZ6JXOmZ7gQS65rzmnpNzC8qCmKWKq150vx9waRmH7AlEyU5pb0+c9oSaAfUmqN5kTU3ZrUdFKc5NwnMfeXHXTEkII7jiS3gWkCMrLdDvSor4mA8LzF4lB7QQ7uQEU8eqK3Kqqxr5czKppy4phQtj2N0WSKe8aR4Gj/+nQXmBLbVhbNEiEnXsSSzebzXo+RMUWq3XZ/n5UMdYffJvVF80qHRks3IPvyXcAWWn1N3UamdUiRdbtIEc+9BblUYQHzkaRwC59kVe59wIQ3h5NnCZYTfSiWJc2jGj3ZtfY0fg7rhiWjXnbuvVuTRtJBF0alAqrOSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiIN8mrMkK/+cetf5oGWuZz78MzLkorbln2bf0jwuQ0=;
 b=KgiwtAdDyN/W0GqH+yrpo+aiz3Kn25k4OJX6eoNWydt0/8rJRa7EME3Bx0g77lwFlXt/+QlF5iVpk1hJB1sNECue96ZeQs0cQyTYRgkjq1t3Ntav7UpdFUjO8oUHrL64c5QwMmqHdTHzGCWL9aO63pptR9ABNmN3Ff3J+oMbYZrmOBVl9NIxq2LIS6XLuqwh0R/cCwpYj91g8Lc3KMz4c+CeUNtGFmksjvFZVQhQvFr4pkvV6OJzfN0IFbHIGe7xjdqJoO6woHsFbt0kPqb1+Mcn1T/TKPz+bdTLQyJBJykgUG4itgsTW1NAwqcVlnglCHnI2FuVs12vn9hhg0GHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiIN8mrMkK/+cetf5oGWuZz78MzLkorbln2bf0jwuQ0=;
 b=i6fb8e6ptXoUXHx9fJDV1c/QEwyIYDintg8CeoV/Xjqxj3d5HjU3OVjzZUyXAPP4f9gaWKbTxem79yLmV2zU2zifNt96G+aVIoBKwhLazialrJWP/XIKI/wg3lhMErh7EK/hHZ7DehGca8vWH8Ndhujp9kLS0HbvI/x2ww4uT3I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB8150.namprd10.prod.outlook.com (2603:10b6:8:203::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Sat, 27 Jul
 2024 01:21:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.029; Sat, 27 Jul 2024
 01:21:44 +0000
Message-ID: <d43aae50-c62d-dbad-081f-0c281f8658ce@oracle.com>
Date: Fri, 26 Jul 2024 21:21:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: if /proc/kallmodsyms does not exist, skip tests
 that require it
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB62875BE51BC23A19B3D1C343C2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB62875BE51BC23A19B3D1C343C2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: e213c4d6-425a-4fcb-5118-08dcadda79c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWEvV0xUWUdCQytNdm9qTER6bjl5R1ZOeG9xamlxZy9FR2xuM0E1ZUhqSWlr?=
 =?utf-8?B?bjVRTCtrWHFSSDF0SmN0NWdabFlqUlUzb2NpSzRMZ0FnV3pFSEtJMjl5cG5i?=
 =?utf-8?B?ZCttMXhYZkkwMzh0dmhHTkQ2RzVwWE5kTUlJVzhBMk9LNXl3YW1nOWtIV1pQ?=
 =?utf-8?B?NFNmYUNBd2xWbHI1c1FyTFF6K3RTY1JXVFEzNXNSSlNnazBId1BqRjgxQkN3?=
 =?utf-8?B?THNxVjRwZUFRWmp1Z3doYU1kV0pmVW9RelYwcEdwemJnYWZiWHVRUU9GTFZw?=
 =?utf-8?B?WHgzOXB4cDFZWnV0VW1teExpSFZvWFR1dlU0QmFVVlpNQldmSncvR0pGYTdh?=
 =?utf-8?B?K0VscTN2ZHJ2eS8vNUdseFF1RFF4OEorSmFkN1BvcW5CL1lGU2JOZi8zblgr?=
 =?utf-8?B?ZWYrMHFyN0lhVy91aGpUMDB4RU93dnk5dDF6MUlmbGlZakxPOWUrV0tkNktI?=
 =?utf-8?B?TFZZNk1xdERHME5BYm0zQ3MwL2VweVg5MzByS1RXUFJmZS9qRTFNdlBwckVK?=
 =?utf-8?B?V2VreHlYekI1WXptZE5MaUk2MkNYbW1zWkIvYlBJT1ZKQk5FMnpmUVZ5RUxw?=
 =?utf-8?B?Rm9wckRoN0J1dExEOXpBcmRlbUswemNTVFdQZmxPbFU0aFl2cEpUR1lhV0lP?=
 =?utf-8?B?Zk5UUnZzR0dCOHJxa0M4bGI1Q3dTNTdWUUFBcjRrZXdSY3pkMVNmNHU3OEdG?=
 =?utf-8?B?aVhUdFpxSnZ1Yk5rRGx0TjhGSmhaN3l1Q2p1UXNYcEY2eGJtMTZPWCtpbzFw?=
 =?utf-8?B?Rkl5Q1Q1cWNHMlZGRGI2ekYvWUFPa1BUbEV3WHdxaEtXaldOY2REMDRqTTVW?=
 =?utf-8?B?VlNwY0toOWZvY2YxV3FlbE1PZnFkVWdvVUZES2ttZllOaC81S3lVaklldzVR?=
 =?utf-8?B?MmVaV21pUCtTZDJZTzFIVWxCaEFHRmVCSWpHVWlCcHdpME5WeWp4U3dncTZ4?=
 =?utf-8?B?MXZRTGw5RFJFdDZCU3ZmaWxGL25JUlBRWkRodTZGK1lFZDlSN0NuTUJpdWF6?=
 =?utf-8?B?Zy9FTC9YN1hFQmk0UDlqVSs2dnJjY1RqVVdkcDRRY20wcUhraHpwTFloMWVD?=
 =?utf-8?B?VElxS2JPRXFtUXlUR2F6NkVBNjFnQzU2NGZLQkM1cm9PZGp5a2ovbkJyRmxm?=
 =?utf-8?B?c2lPVUJiZ0IxbGFIWW9ENjFiQjZmUHo5aGlWdVpZOUU0RG9nY0VTMkFGcW1D?=
 =?utf-8?B?dnkwZis4TXZmbnJCVGNTajhqckNUZndIcUxnUUl3bjFZeEJTSFR4Z0hWMTZv?=
 =?utf-8?B?K3B3WXkyWXN0R3dTcVpyN2dJTEJqVnRNY0IxMFJrVnB5MVUyWnBTRklEVndX?=
 =?utf-8?B?Y2twYmNqMktBb1BMVFRtM2xLcWI2c3l3NlFiL3U4YXN6YkdaRGEwditGSXFC?=
 =?utf-8?B?dHVvcHBWc3p2VHljVWh6MFZoL3VNdDVvRkluWGl2a0UvVlhYOWZKQ2pHRnpx?=
 =?utf-8?B?YUE2SHQ2VHlHUjFVUFlXK3BaV3hFTkx1aHJ1bnZGV1BpbVIwak96dGZNL3ZX?=
 =?utf-8?B?c21QZWZGdnZRNkU5N1lSSjNrSW5MTG41MGxDQTF3WnljT2d0SVBHL0ZoQm1o?=
 =?utf-8?B?Z2Z1czRrZ0FOOE52aUJwSnlzT1lPL0Q3RWdqbnoxZWhIbzhNbUVJNlFUR0t2?=
 =?utf-8?B?WjA5Y2V4T2pQalZXOTRoZmd2Y2VqaytxVDJtbTJrWkZ5QmNpdWNxQk12NDJ0?=
 =?utf-8?B?NUFGQlRuU082MnprWWpnRjBzK0p4T3EvYU5mS0NIQnBYNGd6eVI4YXAxMEo0?=
 =?utf-8?B?RnZHOUZyVHNINVZLU3lqQTN2SVQ2S1Myc2hFb0NnYVRBOE9UVnlxMVNYZDlG?=
 =?utf-8?Q?IJovQTvapSyOtW8yIw482VanIHQGyS1MBRhx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eitZcWxJNWU5Z0ZnNHZlTzVKSDU1L25KNkdXNEZSOHR5bGFTMkNsOW5aaUlM?=
 =?utf-8?B?Mm0xSnBKUGVvc0FIMmsraUJyVWxhMFJnWE9PcHowaVEyYVdwOC9ycGJ5WDlO?=
 =?utf-8?B?aWh5TjZvSTVEVHpObGtnQThRdnBzSFltbEdHSUNjTmFkL3dlKy9tbjY2c0VG?=
 =?utf-8?B?eGNaemlFc05EeVU4SVlIY0l3d0J2RTR4NC9Cd0NLRGt1UUN4VHlFeXgzZ0dH?=
 =?utf-8?B?eGFEZnRDMHk3Mzdub2RQTHhIVXJvUUo3T1JuUkw1MFEwdG1Ma3J1UC9IZkxx?=
 =?utf-8?B?TTZSQW51RktqUjVjMGI2K2M0QythN2xtdFZQSXhGTWVubGJYcU1uYlQ3b0R0?=
 =?utf-8?B?R3hMZDRidUVVUVFNQjFTV1JGUFRIQmxnV2twWmJ2dk9LZEszZHpQUThWaTZP?=
 =?utf-8?B?MkJqeE1vWFI3ZW52VkJqL3gyVkdKNnR5b2RrMEQ0UTE1dktLNy9DeUJxeVBM?=
 =?utf-8?B?MHg2cTY1Nk1iY3pZa0ZDZXIrcVUzZmFYYmluRnQwSGpVR2xORXZUMEdBMFJF?=
 =?utf-8?B?RUI4NkZnMWNkNWJKOHVLKzVzWW9aVTF2VW9NNmNiTTlwTmFoUFZjcWRxQ1Zp?=
 =?utf-8?B?VTEweFc0NDIyZGp6TU80YlZDbHU2NDZIaWdZbGlyaHI3aGRaOGpPNlUwZytu?=
 =?utf-8?B?UkZyTWl4N2pvU1BRMUQwK2pTQkFEZkJkR2dRQ08zVjVHakU0S29WajdlZE1U?=
 =?utf-8?B?cUIyN1ZBdUhSVmdBWDFNalRBSzRsbW9XNTZQN1QxdFE4SnRoTGQ0SXBnci9S?=
 =?utf-8?B?Qk9NaHBKNVBYKzNoN3cwbG94b1lrcHpWMWQ5bWc2YlFNai9oS09EUlhhc21l?=
 =?utf-8?B?L1oyL0FtTE92V1FKQW0wOGFWbkNEd3ZqRCtOQ1lNQjlOODNZb2FrQmNKUU1U?=
 =?utf-8?B?M1dnL0JRSVptejZzZWJVeVluaDRONG8yckc5TzNRdkl4K25PSXJiNzcwRUwv?=
 =?utf-8?B?ZDVpMGVNRThOTjkzeFhWbzJZK1BocUtJUjhHQ2hGeTlYd0t2UVlaTHNxM3p3?=
 =?utf-8?B?WldYZEZSeW5FWXByNDdZVnNlZURZbEsraEtGS0NVUG40LzZwUncyN013bUxY?=
 =?utf-8?B?ZmFRUHhwS1VHWHJhRTRRRHJUbWYzZnVORCt4dGh4TUhzSmFGRS8vQmxFSHJE?=
 =?utf-8?B?WHFuS2g4Rm50REhhY3NIMk15VnJScWFWT25YSDJIeFJQaFYrMjFHSG5Db29I?=
 =?utf-8?B?b3JvL1grNFY3bExNSVFpRzJBd3QvVTJGZmsyQUVvYnh2NHlSMFRRczJkWXly?=
 =?utf-8?B?bnhGeEwwTnZDQnltUzIrYlIrZUdTclFkUzRDY1BCVVZFRmVVM2o4YytvRjBm?=
 =?utf-8?B?Z3R5QWpvb2JUMkhUZVNTK2hPNmZudklQRUp3TkdibGRMenpJVG9UQUJRVW5I?=
 =?utf-8?B?QU96SW1tcVl0QzNXVlFvdjNKbC9maGEvdlNWRXoxakxadG5JbEp4ME5Kd3ZG?=
 =?utf-8?B?RkF2eDBVNDNjbUNTTE5tTGU5Yy9LSXhtZmptdUhiTlFTb2ZTQnZWSE5PVTJv?=
 =?utf-8?B?WWFvYXZ6eVZRcldZTWNpYzRUOE9Nc21NWnE0Y3RJejE1aHJnMWZRT3hIU3dO?=
 =?utf-8?B?U0F6Qk5SY3ppMmViOFRIQVJGbkZubEVzQmdHL0NlU3RnaGp2cVJDRTJmZWds?=
 =?utf-8?B?Y0V5WVpwVFc0Tm5TWkZ6MTJEcUlYWmROLzVzR1JRR2ZHakpvVllvQTBFL3No?=
 =?utf-8?B?dlMxV2U4WFdDbyttRTNZNmhXWnhmdURxR29KWHpCbi9pRHRoMFRHTCtXak5I?=
 =?utf-8?B?Tnl4TE90cVhkM2k5bDR4QXFTMTljVk5RL3B5anpQcTlmZ1Z3ZlJkK0tKMXVE?=
 =?utf-8?B?eGdyNFpnR2k0MEVnTXdPNzEvYjl5MHVhQmNreFJtZVhNT05BQkk0MHBDU1Y4?=
 =?utf-8?B?TXFyb2o3RUxBM1hZRTRaVmhtaDQzcHN6VWQ3NVg3TTlFVVNZaExYenY3R2Nj?=
 =?utf-8?B?MkF6aFJlSUxMVDB2NnJ5VFBJOFdnNkJxZU1HRW5xYmY0QTdubWp4MStsdzNm?=
 =?utf-8?B?WGtqa1pTUjZFMThnTDJKUkhsYjRJL3lPTWlyeGREZVlLNjIyNVZScEcrcld0?=
 =?utf-8?B?L2xHQzk2Tkx4bDc3emFqTGdIeWNDK1BZYnE4cWZLcDNTczdhSk9rV1pxL0kr?=
 =?utf-8?Q?XFPvmUVCzyAdJfo3NC7UEkJWF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Cqk716FzLprGHcfdXbEAcblxrkZ+NHlpNLAnF6YEsw+IGMNfoiT/elqG8y7IY3XOha5IPNqAT+6H7thPY2MGsbuTe0bejgmWN4yrVkbfDZQ/csMpSd3ncPqtiV40B3jgK6n9Mw16YwkN4COblBPGdyL7mxEizUkAA4gKqAi7Np1s9cubYXz4LnXZeOLmM+LENXjyeRkl+K3+ocDrEFC2PdN5AvaPR+atpUf1/1+K/PySQQu+8b+V0BsM6Pv97O/P2OprWbgvfEGJgVyAYsBODSqcuWXML7i7UDPmw9+Q4Vut6l+E2Scid9mJgjFwJHmxYlv76EyKoGUUABbuu+UCaR5kDhI1UQwDsli+0eFzo/7zvwqCfyQ76AsSFT9QAwP7QTwC8bALKzdknArw7v+UmDeEj6DDXkc9sKTTVs6Oyrv5piRTsUDaZF0SnAljOnosE7FPpapKhxysUCaP80iT4ES6u1H1LSBRWDxv9iw8U+SM/AiW6fKKZBg5uonEaaftCR/BKwpKbSa1xbq0NyTA+i0sA1aCEbsLcw9KsswvGeadfv4UcdjDxHBoGZzJ+GwqmB/lVSCHsla0VCGgg5W4WXXiRkL1GrrdFpTa03z7mZA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e213c4d6-425a-4fcb-5118-08dcadda79c0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2024 01:21:43.9588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGsipt2yWaZIxTgidJxSSJSoFyFqPYO/X6Vk4I18eJDJOfsgHzZgWQjsntfT0gcGZX1OKJmPpAR5ZEdtHLST0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407270008
X-Proofpoint-ORIG-GUID: -rDDVs3LSEkrQ1B-SzG_XEkWshhdbGJ0
X-Proofpoint-GUID: -rDDVs3LSEkrQ1B-SzG_XEkWshhdbGJ0

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

but two comments:

1)  There remains a possibility that we think kallmodsyms *should* 
exist.  That is, the missing file is less a reason to skip these tests 
and more a reason to investigate why the file is missing. I'm not sure 
if we want to address that.

2)  In both files, the compact fix appears between another check and its 
preceding comment block, which describes it.  How about inserting the 
fix before the comment block, perhaps also adding a comment for the fix 
(mainly to match the commenting practice of these files).

On 7/26/24 19:48, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/aggs/tst.aggmod_full.x  | 4 +++-
>   test/unittest/aggs/tst.aggmod_full2.x | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/test/unittest/aggs/tst.aggmod_full.x b/test/unittest/aggs/tst.aggmod_full.x
> index 94239b47..955fb52a 100755
> --- a/test/unittest/aggs/tst.aggmod_full.x
> +++ b/test/unittest/aggs/tst.aggmod_full.x
> @@ -1,7 +1,7 @@
>   #!/bin/bash
>   #
>   # Oracle Linux DTrace.
> -# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> @@ -12,6 +12,8 @@
>   # often of the form __key.*.  If there are few (2-3), the bug is present
>   # and this test should not be run.
>   
> +[[ -r /proc/kallmodsyms ]] || exit 2
> +
>   nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
>   
>   if [[ $nzero -lt 20 ]]; then
> diff --git a/test/unittest/aggs/tst.aggmod_full2.x b/test/unittest/aggs/tst.aggmod_full2.x
> index 2cc64c94..2e4c5900 100755
> --- a/test/unittest/aggs/tst.aggmod_full2.x
> +++ b/test/unittest/aggs/tst.aggmod_full2.x
> @@ -20,6 +20,8 @@ fi
>   # often of the form __key.*.  If there are few (2-3), the bug is present
>   # and this test should not be run.
>   
> +[[ -r /proc/kallmodsyms ]] || exit 2
> +
>   nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
>   
>   if [[ $nzero -lt 20 ]]; then
