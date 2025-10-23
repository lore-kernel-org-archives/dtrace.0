Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A634DB7F
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249236; cv=fail; b=SHwnadivQ4OMkSDfON86TUfu6gIdhtgS8n1g2ogeniKXopHGtQ0vt+cc6nYu7Fu07xdZXygldXT18kDvCRS5d49YxR7ewb15WnoKt8wAUsR3kfliesKjhfqC/WMojrMSGI7Ug7LAeCdIEREQV3AK6dsY6ytngSETHLoC7K3meis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249236; c=relaxed/simple;
	bh=XSONos+j0s3q8rW+EnkvfTi9pvYWpn2wBlpKNt6CPLM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ByrgWVEArMY0EPiu76SMH/Tze7v26YxkTx+N44v+Kh92xyIBSt57RZDNr17wW5UvITtM0Q6cppScrXFDWxXup/Vrf/A4rOgBZ+EfAFe/C2usrLO7MENiJAKC52d8AyWe8urIW86lIL157v8u2qaArCq6zYUhJtB3DxW6/n1ih3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WJSH7NXy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KFFSgzJa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WJSH7NXy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KFFSgzJa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NJriku003413
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LMLiOxYZvh9gxBNWPEiewvxAH7ovYtULCv0Khoa62xE=; b=
	WJSH7NXyr5JiKZOAET7C5UNZnKdCNA+Iq4MfoXw9tu+jPY+3bSLy/dnB3uQrsP9i
	z3EFZFv2HpKDURYJIyyMAbtdkyAA5cLcqImYbOPQAFI9XA3d0nByd3oI+FdCcdYA
	eriJBhjwjZyPNdvyXdF6LCa8syK+SKgUtSrj/ueKvrkbUiuD7Jd3ESw+RAQIDRbc
	MqhnQsfUGep3j+IiuA73ynkm6U2EdwHrVSOdlZasqHGvTmgGUoVGt7Z7kecUA28W
	pQCREAQ7VkOofbGQkeXZc/TigBOKIAiaer5+X+bDpZGvge+OBGHadpNB9AV1C+iu
	WpSo4iKA3NI5iDeTZobysA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ykah12qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:53:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NJgYbV012674
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:53:50 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf1be6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbchplUWC2QztiF9QaiL1OlwmlL5blMLMxfRj91dMQoRTEcPXvx94CZVRg5w3hVbQepITVdBhOYG4MRw72592ZUst7jHIc/iMlO5uId9457WyTutWZ+ZZa0+rvFfcXj/GeNueLTGNc1rvHxXL2P0gMQGTzTSl81FyVLcy5ZgRBmn8MUi7lQsjbMZvql7DDFtAPSliVAFDtTSABpDSRZqsIoaFrnevEkkmmmGB7GyoNBzkZIh4mSZno+3zttxBKWB6ea+WuRmJWfTEd0dfVe8TPvPw6oPyRvweip1ObZplnMt0eb2zi1O9ncX8qusBDTjPW3ZxreOjrv2KbhY6oxmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMLiOxYZvh9gxBNWPEiewvxAH7ovYtULCv0Khoa62xE=;
 b=quDjapnzdpYv/g6RJkSJDqLbMfrsMbgpF9pSDa48yD0y7Ny8ZcHTR7EZ8ghAGoCSM5/UqMaEsXJH/zzaRb2LaYWSLOfk+/6LIkA6Zn/2eP+tC4RXB/AJe5ifzO+n7E6FiXv+5hUR4pmzILAdBAJYXu9NWnc6RXtkD39DAwtpriNDx+cSXhHlabXb9hTnNMxhp8CzHEw0JzX16ec5sOrHXQTzqhjZP3Oa4DmRfEP8btnPEzCumvOCYl4atcsCPWpD/9NXwwowjpXhQQKBnNOryoxSGTvPd3ZdW6y7v5J+AWb+DQU+6yowepZOitr8Jbck4MtEPz6mVAFwjjtkGYNbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMLiOxYZvh9gxBNWPEiewvxAH7ovYtULCv0Khoa62xE=;
 b=KFFSgzJaWaoTGKo3/XrCU3Cflbsa1/3oxFVbi73c6Ga3T52S7Km8h0p2cgwxZtkHFfWuMc0xUvxAk5XXwx9xt9cJy2+aFywmlrTEYIfbMh21de6x8bl6B8uuPZeaxoGpYa7Y1yF9VF76d/Do6OfkDC+YldBWn6DP8yqwQ1QrQKg=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:53:47 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:53:47 +0000
Message-ID: <0881ec51-e603-41cd-a5cd-a2d59e4e6bae@oracle.com>
Date: Thu, 23 Oct 2025 13:53:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] doc: Clean up dangling anchor links
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-2-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:930:4d::11) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 54080f08-0eed-40a3-bcbd-08de126de0f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFI2bWF1c2VJSUNLUUVqT29STTBWRWpVTkd6TVhGUENKYlF1K0FURnhwY3Y4?=
 =?utf-8?B?VTgzTU9vOWRYN3lqcitjRGJHQytTQU5KUXdQU0pONGxac1JDeVVXVDgyNHdW?=
 =?utf-8?B?ODIvKzgxVzA5Z2FyY25vWVdyQTIvL3RxclBrUHBUWXFva0g3ZEpRaDUydlZD?=
 =?utf-8?B?d0pyb2pkOWtlYzA1K1gzYjJYb3ZXUHNMdGJLN0xiMUJ4Y0VCUFRRcXdheEtS?=
 =?utf-8?B?VWNCalkrZmwvWGRhaWFqTGlzbE4zYWM1YzU5aXQ3b0EyQ05UOTUrOGlyVW53?=
 =?utf-8?B?cHZ1UjM4UlpvS2ZSdUlpVGdTREtGOGpwY3gxT0c2R0lCSXFoRjRVTitkRmYx?=
 =?utf-8?B?ejNHR3N2MlFKUlJyQk82eWl5L1JaSzM0VWNiYm1NTEZaTk9wMU00T2JRcTdJ?=
 =?utf-8?B?bHMzK25nOEkxL2dGUXd5VVRMOU94Ky9lNVFuMDVITlZOVndDMElZMEVjSGZh?=
 =?utf-8?B?ZGJNL1VUWU0rY0gweVNjSmFCQkV3Q1dBK0xEU2Fzdys2ZXNPK21BM0VYWS9X?=
 =?utf-8?B?UzBjVXZVRFVhVm9PQkZBRmdaNzloT3FyeDFSUFpOYmxlKzV5NTQwSlpGNGdV?=
 =?utf-8?B?d2diNDNHTzZ6RkdMMnQvdEE2TFVLNnN0OGFuL1FYaktjVkN0VEEzRXNlRkZO?=
 =?utf-8?B?dmYzYlpkUmNqek1iSU5venFCNTJWNW1HRmRoZm9zNXlOcXpNYW9jMzhrUWIw?=
 =?utf-8?B?eWJEVVhrQWdvZmdFWmRDc0ErZld3Z09OTVRnZXM4bzdIMkY1dGhlY0lPT0RX?=
 =?utf-8?B?enNNQlBpTTZsOHlSVGtKVWhGcldyOGtaTzNPSjNCQ0hUdXZQM08yZkZGdGhH?=
 =?utf-8?B?Z2xuMGo2WUlQQWY3cWZKcUhJR0RRMEFWWkxzaW5vMGNWbWJrT2xWVk9DQU1x?=
 =?utf-8?B?VUZQWERSL3FRb1ZldkwrTjl4S1NzeUJmYllaNEJjMThjajlIVkp6V2wzVEE0?=
 =?utf-8?B?RWp3MFVjWm5rU2NFaHVBb3lmalpWR2Z2WGtBeDVOWWZxY29Idm9QVi83N2Z1?=
 =?utf-8?B?dUNxWFMxQ2hHMDk0bThvWVVTUDAwM0ZTYk5UdjRZZW4rR0IwbDM2QkJmMGt0?=
 =?utf-8?B?U0NlMFV2WGM2V3A4Q0k3SElSWERIQjhBSFh4ZHc3VTJGQm9UYnVGRlkrQVRD?=
 =?utf-8?B?T2lUby9zbHNJSFpsbGNvWkt4OU5HUm1EZCtmTTJueVJsOTlaTlpxdlY2Mlh4?=
 =?utf-8?B?TitUWHNIWG1MdmszTUJIZVNPSCt0TzIwRkR0L2hpMmFKYmdzRzJjMnVFT0JF?=
 =?utf-8?B?QjlaNThoVFdVTGdCTUdrcXlLdEFOUWtBSFpqOVlDR1U0M0ZHdFloSFFlMFY4?=
 =?utf-8?B?dUlFMzlVaHM0TDNWTGhaNkFGQ0VLN1RwMGJoZi9NWTNYd01uWjdTWStkU1pj?=
 =?utf-8?B?c2laZTd0aEJYOUtGUndJc3J2WG4rQzRublBrWWxqSXRpUE9JYjhuTzlPZkth?=
 =?utf-8?B?Ty9RTjlZb3pPVmlZbDNzRWNTRDFDMzgrbyt3Z1JzcEJPQXBrN05TeG5rSWJ3?=
 =?utf-8?B?OU56THNxRkIydTIrWXpLRUE2emtvcmVwV0hxTC84QVBIQkNzc0g0em9JeU14?=
 =?utf-8?B?NkpXek5RUmppZWxxS0R1RmNYT3pyUzhWZnUwakE0QzByakJKMnBOR0VhS3l3?=
 =?utf-8?B?QXZJM3VZTUNwR05NWFNpVUE0VWs5Z2d3ajUwc1dEckYzV3dXRjU5U2N6N2pZ?=
 =?utf-8?B?ck1mSVo0MXYwb1UrKzk5dnpFYmlEendUbS8vV3ltK2dVeHdXMTdHOFc4aGUz?=
 =?utf-8?B?dzIvd0RCOGJPTmlFK0lmMG1MVVBCL3F5cEVXd2dLanVtb0diQWk3QXFvUU5h?=
 =?utf-8?B?LzRUTzgzVnJpYTJmMDhnTndmcVBCMEJ3U1J5R3F4bG5Ra2FFd08vQWRnVW5H?=
 =?utf-8?B?QmFyOFFLcSt3S1hURUJveXFCekVtOFM5djd1ODhwTWpXMmk4U3pjSUFqWEE0?=
 =?utf-8?Q?JsQ/bDnBh7bt/3Bgv5jTzhBtbCWloTyG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjlyblRacmc4YzBJZ3RWMXJ1enJ6NzAyTm8yK0xxRFR1cjdPUFdMY2R6dGNU?=
 =?utf-8?B?TUZZaFE4Z0VnR0FYTHVPbkxBVXlZbHZQOGV4Z2M4WVd0MlJvWnp1UDBtYmRV?=
 =?utf-8?B?S2xwMERQblFDdEtCOTdRRWJYTjh2UHVqWWxhRmdxeDkxekRHR25vZ3JiV29D?=
 =?utf-8?B?RGZoRll2OUh2MktPVTVvSlJxcDkwY2VoTE9ZY2E0anNRZDU0blNxWjdrcVY2?=
 =?utf-8?B?OHowWGVPTXovNElPZGlRb2VVRmZHMHE3aEY0SlpkQi9VV1NicERidUFjV2ZZ?=
 =?utf-8?B?a1ZlaDd0dkVlcHd1NU5EV0UyK3JnU1g0b0c0dlMwVldsSXNienlWUThrTTFv?=
 =?utf-8?B?UVBCc2YyMC84empnMDFaWkxWVDgxOWF2UlVaT3RWRW01ZzQ2UXlKdTFieWdQ?=
 =?utf-8?B?L0JIS3hBcjA0dkJhZENXblB5QkxERnV0d3E4Y0ZYZnpndWhVOElva1pqUnRO?=
 =?utf-8?B?WjNVck5IcnE2VHlSb3dBdjIycU1GdU5jdURTbERkVTZNRHZBTS9PMzU3cHQ0?=
 =?utf-8?B?Q0tuNGIzeEZ5ZCtOdzVoZjlYeHpvNzJxL1c5TnZobHdEV1hGQk03R3JMQXJ3?=
 =?utf-8?B?SmdKeGV4Z3F2MkU2YktJSUZmbjFUeGp1OVlLeFRmY0N3bDJ3YjBid0Q3amVN?=
 =?utf-8?B?czVtSDNyMkp3Q0J6NUtTV2ZqTWN5YzFlYXFZR0NVN3ZlejJveU9uTnNmVS93?=
 =?utf-8?B?bjRic3NBaXQyaUhkMzZ5dkVxallCaGtCQkxZSHZyMjBzb093anpUSFZ3akFK?=
 =?utf-8?B?NlBhcVNNb1REU3FLejRBc1Z3MHdtbWhwR29pSmFYc0piUTk4bmF2b0wwdnE1?=
 =?utf-8?B?NGVFVDhPVzNXb3kwVmVoWDkzTExDd1JUa01YMzFnOVIzc1RYd0swdWI2YWJT?=
 =?utf-8?B?Z0hQV3hoR0JSakszdkxnOTNNc2RWTkZxSi9SQVc0em42MXFEcGxEWVNXYktw?=
 =?utf-8?B?NDFhOSs5UVhHUEhxNUtRbnJXNkRLQUZncERvTDhaUS9ZYldrVWJKVzJOTVFD?=
 =?utf-8?B?YnRySElVR3VEd3NxUkU3Nm5aUVBnUElxcEFNOU1IWU1ldmpQK3h5Y3Q0RVBR?=
 =?utf-8?B?SDlseGl6Uktya2dPcWI1TkNucUJvT1dSOW5DVVluS3lWMUZ0WlBXanlZSVNq?=
 =?utf-8?B?RXd6U2JMVVNzcE1SNTMyQ3lkMDFNZDFwUDNqK3pGcE44ZWVQd1l2MEdTWU5u?=
 =?utf-8?B?RzRja3lBN2VNRlZHaEVMTmpsMnRDL3BKQTZTWmZnUTdHNU5rSDErMFZLTEJN?=
 =?utf-8?B?SHhGYm1aeUlSd3B4SEt2QnlxS0JsczU2TDJvTWNvdDJUV1k2VkFYd0sydFVv?=
 =?utf-8?B?SnYyc2dONGxzWFhCN2FEZHlVa2VQdldmRGV1U2VQMDViY1RZOU9hRGpUK3FD?=
 =?utf-8?B?L1lFTnZoLzBpbWd3TDd1ZEswYWJ1L1hyaER5U0hDZVp1aUMxODJoMGt3Yis3?=
 =?utf-8?B?U1RIbmw2STVGYjl0dGJlcXMwZWlWU1ZQcXBMT1NJVWVUWG5IU2RvTVFxVDc3?=
 =?utf-8?B?V3dkUTUwYUt4MG5GaWVVSmU4NDN6QWEvTVZ6d1pHcCtkRTJBRk1hRFlVQ1Bm?=
 =?utf-8?B?dHdRRGZJUjNsUzJGMUJFWUpYeXBBdXhGdStNZi9WWUpWdzluVmYxSHAwR1dR?=
 =?utf-8?B?LzdKdEdLc1ZMK0EvMzJmMnJkN2g3czN0SCtDZ0tlQ2tHbERmR3dyMm8wZDht?=
 =?utf-8?B?b2JSZmpNM21GWTB5Zi9aQ3diaWtjWTNrZlVrejlaZHo0QnUvN20xRW1zNzRH?=
 =?utf-8?B?TjU4a05HT3JvL2w3ZHArTXNTR0o3TlhkbXppVWtMcEtlQ1QwcVo1ZkF6K3Ir?=
 =?utf-8?B?NjNQUmUybnhHZ2xrMUVkOHZYQVM5bXlXMHhVb1k2OGRjbUNnY3ZMS1pNV1Zn?=
 =?utf-8?B?ajJDRi83QUFadm5McjF0UFd0RTBteERRb1dMdDdWbkl4elB1VDBnTlZRM2Jj?=
 =?utf-8?B?RENsT2swOXp5SXRtdTlNekN1N0xSTmVDeml6UHNkVnBpWVhZOWt0RjllWTY1?=
 =?utf-8?B?RUNaUXgyTzJnNzd3TWNYWS9SQlNGTWdiak1DQitFTm0vbVR1OURocXJ6OWFG?=
 =?utf-8?B?OHV5T0o2Tk5pcHJYRFpRZHJGOWx2QTdQZithU3o0ckJqUWh1ejdScVpIb3FS?=
 =?utf-8?B?N2ZpaGo0OTBQMnNQNytuSThITU4yak9wbURRbUpKSHVnNU5XWXEwdkR5eWdm?=
 =?utf-8?Q?C+J4R59bwXSMNM+49xENJ2g=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F4RUQyIlQsU3T9uCyV1jt39CeUCm+XftYEZAQWqM/55Og2mJQ7xJgoukDtK+t0SLfGLzRgbtAcpICZJ7/W6kdjJloXMAlDKkK8M5zFah/kUGpbBRRc7e2TgDU1UdUtib+w6LIY9OhJVn9g6h/Y3ucGfoge2MGB6CurlOcvSpaAoVZgxFpqipmabFRSt7wZQNjiKOKkVZDkEYJivfPWBdxgLoipJw7tHUj+J+iJ2X3Wbfa8sIfSy6iRsKHwWyfBOjFYGz7dHZeE7qIy4iuARw6x6Ysa2aJ9JchSkZnep5e1Mslw3dFEnzQ00hNtBRIrWQWOpvK8pQoZLFBX24zj9Figrtrccz0lhCa4RdVJm7M3i5WhkqraHavKHMeMvF2K8KpHrMS/a1/cm6gRJ6CNNgQkFd8/uB91oLVBBhDPuxPSaiQwOEaSfDyMOJMz1QNwlozlLkX1J3gIPAMbeJlIrmvGe2Sw4ZWzMUGWAEVoSeNzRSEAs+5yXc5h26BleD6jT1Yny5XD6ng7KQBorNmpYpDoimBxPZS8Az9+QVgwBkP9HARDgHDMXsxjZof5eszh6/hphKhGOvvRQIQymVtiV40YaSYuorUgOVavoxl885XUs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54080f08-0eed-40a3-bcbd-08de126de0f0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:53:47.0126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5jzOWbdIq6RSY5i32IcDE33yyp7wSbO8+P3Y4HoWSnKppeGG4s+ZOv5JqD2zIxU/VkeVlxRhepZdGgKbRK4XlNxeSgNTZYz8Ds6U3ay3A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230182
X-Proofpoint-ORIG-GUID: -SpVLAEBR4QckASC1iYiclItBtBcLjek
X-Authority-Analysis: v=2.4 cv=XJc9iAhE c=1 sm=1 tr=0 ts=68fa87cf cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=zElM5TJG9adPCS0WnoIA:9 a=Vl0SkxlkIPbKrL4X:21
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMiBTYWx0ZWRfXz/zOf3Le8JFE
 m/nKll5dqaGhNqLEZlzGNYCwV5BgyUp6i/On00rJM8qaXoVoeFUSVAS3rT7aW3vGhbMov6s0RsG
 5R7NT9LRN7Owh2JvFiyaAFB1NMoYPz9KogRd1dwTP8brxiK9PaiTKYdhBxFjEwlIPeyv1l8yhYm
 kbQTrYsi6NxQ91sCfoZVj04/DA2n4wcOOtCeo49VhKO1+y5lPocNa0CHZlbzN8QKz1Y2cIE3YJ9
 dMuhQc6GpXYWCqXgbI39upeyNCThU0f4zWhbX8R2oY0SeFQReQNusg+cw5S3yhzeU4Knv17xCgQ
 lnUE1yBuCokiHbykrgPjTrfG5i9d36sPafUz0lOJCQD+yxvyp2m71F7+etEM1agmYU9IHdEM82j
 u94i38A5rae2HeOdFXUCfNedTh0p6w==
X-Proofpoint-GUID: -SpVLAEBR4QckASC1iYiclItBtBcLjek


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Links within the User Guide can point to specific anchor tags within a
> page by appending '#' to the page in the link.  A number of links have
> the '#' but no tag.  That's okay, but tidy them up for a cleaner look.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../dtrace-components-and-terminology.md      | 10 +++----
>  doc/userguide/explanation/dtrace-concepts.md  |  4 +--
>  doc/userguide/how-to/dtrace-guide.md          |  8 ++---
>  .../dtrace-howto-create-a-dtrace-script.md    |  2 +-
>  .../reference/d_program_syntax_reference.md   | 16 +++++-----
>  .../dtrace-ref-DTraceSupportforStrings.md     |  4 +--
>  .../dtrace-ref-PointersandScalarArrays.md     |  2 +-
>  ...dtrace-ref-TypesOperatorsandExpressions.md |  4 +--
>  .../reference/dtrace-ref-Variables.md         |  4 +--
>  .../dtrace_builtin_variable_reference.md      |  2 +-
>  .../reference/dtrace_command_reference.md     |  8 ++---
>  doc/userguide/reference/dtrace_providers.md   | 30 +++++++++----------
>  .../reference/dtrace_providers_proc.md        |  2 +-
>  .../reference/dtrace_providers_sched.md       |  2 +-
>  .../reference/dtrace_runtime_options.md       | 14 ++++-----
>  15 files changed, 56 insertions(+), 56 deletions(-)
> 
> diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
> index be6c649d7..b187055a4 100644
> --- a/doc/userguide/explanation/dtrace-components-and-terminology.md
> +++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
> @@ -3,7 +3,7 @@
>  
>  Learn about the different components and the terms used to describe them within the DTrace framework.
>  
> -DTrace is a framework that dynamically traces data into buffers that are read by the `dtrace` command line utility. The `dtrace` command line utility can run programs that can implement certain functions by compiling D programs to generate eBPF code that's loaded into the kernel. In practice, all interaction with DTrace is performed by using the `dtrace` command line utility. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md#) for information on how to install the command line utility.
> +DTrace is a framework that dynamically traces data into buffers that are read by the `dtrace` command line utility. The `dtrace` command line utility can run programs that can implement certain functions by compiling D programs to generate eBPF code that's loaded into the kernel. In practice, all interaction with DTrace is performed by using the `dtrace` command line utility. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md) for information on how to install the command line utility.
>  
>  **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
>  
> @@ -31,7 +31,7 @@ Output is displayed to show each of the different values that are used to refere
>      ...
>  ```
>  
> -See [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#) for more information on how to list and enable specific probes.
> +See [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md) for more information on how to list and enable specific probes.
>  
>  Probes are made available by *providers*, which group particular kinds of instrumentation together. If a provider is related to source code, its probes might also include information about the piece of code that the probe relates to in a *module* and a *function* identifier. Therefore, a probe is identified by a *probe description*, grouped into four fields:
>  
> @@ -64,7 +64,7 @@ Some probes don't have a module or function identifier when they're listed. When
>  dtrace:::BEGIN
>  ```
>  
> -Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md#) or the [CPC Provider](../reference/dtrace_providers_cpc.md#), also don't include module or function identifiers in their descriptions.
> +Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
>  
>  ## D Programs {#concept_terms_programs}
>  
> @@ -119,12 +119,12 @@ The program probe description matches all system call functions at the entry poi
>  
>  Although you could code an application to calculate an aggregation for a set of data, when many probes are firing concurrently, they can overwrite each other's updates to the aggregating variable or the calculation can become a serial bottleneck.
>  
> -DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md#) for more information.
> +DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md) for more information.
>  
>  ## Speculation {#concept_terms_speculation}
>  
>  While predicates can be used to filter out uninteresting events, they're only useful if you already know which events you need to filter. Because DTrace is often used to help debug particular system behaviors, DTrace includes a set of *speculation* functions that can be used to trace data speculatively.
>  
> -Speculation is used to trace quantities temporarily until particular information is known, at which case the data can be discarded or committed. By performing speculative tracing you can trace data until you know whether it's useful. For example, to trace data about events that might trigger a particular return code or error, you could speculatively trace all events and discard the trace data if it doesn't match the return code that you're interested in. See [Speculation](../reference/dtrace-ref-speculation.md#) for more information.
> +Speculation is used to trace quantities temporarily until particular information is known, at which case the data can be discarded or committed. By performing speculative tracing you can trace data until you know whether it's useful. For example, to trace data about events that might trigger a particular return code or error, you could speculatively trace all events and discard the trace data if it doesn't match the return code that you're interested in. See [Speculation](../reference/dtrace-ref-speculation.md) for more information.
>  
>  
> diff --git a/doc/userguide/explanation/dtrace-concepts.md b/doc/userguide/explanation/dtrace-concepts.md
> index adb5413d3..6e2b91a65 100644
> --- a/doc/userguide/explanation/dtrace-concepts.md
> +++ b/doc/userguide/explanation/dtrace-concepts.md
> @@ -5,8 +5,8 @@ Explore DTrace at a conceptual level and understand DTrace components and termin
>  
>  The topics in this section are general and can help you to understand what DTrace is and how it works.
>  
> --   **[About DTrace](../explanation/dtrace-about.md#)**
> +-   **[About DTrace](../explanation/dtrace-about.md)**
>  DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
> --   **[DTrace Components and Terminology](../explanation/dtrace-components-and-terminology.md#)**
> +-   **[DTrace Components and Terminology](../explanation/dtrace-components-and-terminology.md)**
>  Learn about the different components and the terms used to describe them within the DTrace framework.
>  
> diff --git a/doc/userguide/how-to/dtrace-guide.md b/doc/userguide/how-to/dtrace-guide.md
> index 137d62e3a..02863588b 100644
> --- a/doc/userguide/how-to/dtrace-guide.md
> +++ b/doc/userguide/how-to/dtrace-guide.md
> @@ -8,12 +8,12 @@ Most of the information in this document is generic and applies to all flavors o
>  
>  The topics in this section provide guidance on how to perform particular operations with DTrace and serve as an introduction to installing and using DTrace. By following steps in this guide, you can get started with DTrace immediately. After you have explored these topics, you can either review [DTrace Concepts](../explanation/dtrace-concepts.md) to get a better understanding of how DTrace works and how you can improve the way that you use it, or you can use the various references that are included to find out more about writing D programs that do what you need them to do.
>  
> --   **[Install DTrace](../how-to/dtrace-howto-install-dtrace.md#)**
> +-   **[Install DTrace](../how-to/dtrace-howto-install-dtrace.md)**
>  
> --   **[List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#)**
> +-   **[List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md)**
>  DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
> --   **[Create a DTrace Script](../how-to/dtrace-howto-create-a-dtrace-script.md#)**
> +-   **[Create a DTrace Script](../how-to/dtrace-howto-create-a-dtrace-script.md)**
>  Learn how to create a DTrace script to develop understanding of the D Programming language.
> --   **[Use Predicates For Control Flow](../how-to/dtrace-howto-use-predicates.md#)**
> +-   **[Use Predicates For Control Flow](../how-to/dtrace-howto-use-predicates.md)**
>  For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
>  
> diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> index c4fcb4ed3..199649a9f 100644
> --- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> +++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> @@ -3,7 +3,7 @@
>  
>  Learn how to create a DTrace script to develop understanding of the D Programming language.
>  
> -Ensure that DTrace is installed on the system and that you can list and enable probes. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md#) and [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#).
> +Ensure that DTrace is installed on the system and that you can list and enable probes. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md) and [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md).
>  
>  This tutorial provides successive steps toward developing a DTrace script that you can use on a system to gather useful information. You can use this tutorial as a framework to create other scripts for DTrace, in future.
>  
> diff --git a/doc/userguide/reference/d_program_syntax_reference.md b/doc/userguide/reference/d_program_syntax_reference.md
> index cd1ad5c1b..862ce0322 100644
> --- a/doc/userguide/reference/d_program_syntax_reference.md
> +++ b/doc/userguide/reference/d_program_syntax_reference.md
> @@ -3,20 +3,20 @@
>  
>  This reference describes how to write D programs that can be used with DTrace to enable probes and perform operations.
>  
> --   **[Program Structure](../reference/d_program_syntax_reference_program_structure.md#)**  
> +-   **[Program Structure](../reference/d_program_syntax_reference_program_structure.md)**  
>  A D program consists of a set of clauses that describe the probes to enable, an optional predicate that controls when to run, and one or more statements that often describe some functionality to implement when the probe fires.
> --   **[Types, Operators, and Expressions](../reference/dtrace-ref-TypesOperatorsandExpressions.md#)**  
> +-   **[Types, Operators, and Expressions](../reference/dtrace-ref-TypesOperatorsandExpressions.md)**  
>  
> --   **[Variables](../reference/dtrace-ref-Variables.md#)**  
> +-   **[Variables](../reference/dtrace-ref-Variables.md)**  
>  
> --   **[Pointers](../reference/dtrace-ref-PointersandScalarArrays.md#)**  
> +-   **[Pointers](../reference/dtrace-ref-PointersandScalarArrays.md)**  
>  
> --   **[Structs and Unions](../reference/dtrace-ref-StructsandUnions.md#)**  
> +-   **[Structs and Unions](../reference/dtrace-ref-StructsandUnions.md)**  
>  
> --   **[DTrace String Processing](../reference/dtrace-ref-DTraceSupportforStrings.md#)**  
> +-   **[DTrace String Processing](../reference/dtrace-ref-DTraceSupportforStrings.md)**  
>  
> --   **[Aggregations](../reference/aggregation.md#)**
> +-   **[Aggregations](../reference/aggregation.md)**
>  
> --   **[Speculation](../reference/dtrace-ref-speculation.md#)**
> +-   **[Speculation](../reference/dtrace-ref-speculation.md)**
>  
>  
> diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> index ea9dfa306..98f482c63 100644
> --- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> +++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> @@ -31,7 +31,7 @@ In the next D statement, if `s` is of type `string`, the string type indicates t
>  trace(s);
>  ```
>  
> -You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md#).
> +You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md).
>  
>  ## String Constants {#dt_strcon_dlang}
>  
> @@ -80,7 +80,7 @@ Scalar type expressions, such as a pointer or integer, or a scalar array address
>  
>  ## String Comparison {#dt_strcomp_dlang}
>  
> -D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md#) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
> +D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
>  
>  <table><thead><tr><th>
>  
> diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> index c68982d40..da4b69333 100644
> --- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> +++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> @@ -53,7 +53,7 @@ dtrace: script '/tmp/badptr.d' matched 1 probe
>  dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address (0x0) in action #1 at BPF pc 156
>  ```
>  
> -Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md#).
> +Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
>  
>  ## Pointer and Array Relationship {#dt_ptrarel_dlang}
>  
> diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> index 0e776867c..1a1549445 100644
> --- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> +++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> @@ -390,7 +390,7 @@ Type Name
>  16 bytes
>  
>  </td></tr><tbody></table>
> -D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md#).
> +D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md).
>  
>  ## Constants {#dt_consts_dlang}
>  
> @@ -664,7 +664,7 @@ Arithmetic in D can only be performed on integer operands or on pointers. Arithm
>  
>  However, the DTrace execution environment does automatically check for and report division by zero errors resulting from improper use of the `/` and `%` operators. If a D program contains an invalid division operation that's detectable at compile time, a compile error is returned and the compilation fails. If the invalid division operation takes place at run time, processing of the current clause is quit, and the `ERROR` probe is activated. If the D program has no clause for the `ERROR` probe, the error is printed and tracing continues. Otherwise, the actions in the clause assigned to the `ERROR` probe are processed. Errors that are detected by DTrace have no effect on other DTrace users or on the OS kernel. You therefore don't need to be concerned about causing any damage if a D program inadvertently contains one of these errors.
>  
> -In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md#). You can control precedence by grouping expressions in parentheses \(`()`\).
> +In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md). You can control precedence by grouping expressions in parentheses \(`()`\).
>  
>  ## Relational Operators {#dt_relatops_dlang}
>  
> diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
> index da2130fa6..bc10071ca 100644
> --- a/doc/userguide/reference/dtrace-ref-Variables.md
> +++ b/doc/userguide/reference/dtrace-ref-Variables.md
> @@ -15,7 +15,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
>  
>      where *name* is any valid D identifier and *expression* is any value or expression that the variable contains.
>  
> -    DTrace includes several built-in scalar variables that can be referenced within D programs. The values of these variables are automatically populated by DTrace. See [DTrace Built-in Variable Reference](dtrace_builtin_variable_reference.md#) for a complete list of these variables.
> +    DTrace includes several built-in scalar variables that can be referenced within D programs. The values of these variables are automatically populated by DTrace. See [DTrace Built-in Variable Reference](dtrace_builtin_variable_reference.md) for a complete list of these variables.
>  
>  -   **Associative Arrays**
>  
> @@ -29,7 +29,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
>  
>      Where *name* is any valid D identifier, *key* is a comma-separated list of one or more expressions, often as string values, and *expression* is the value that's contained by the array for the specified key.
>  
> -    The type of each object that's contained in the array is also fixed for all elements in the array. You can use any of the assignment operators that are defined in [Types, Operators, and Expressions](dtrace-ref-TypesOperatorsandExpressions.md#) to change associative array elements, subject to the operand rules defined for each operator. The D compiler produces an appropriate error message if you try an incompatible assignment. You can use any type with an associative array key or value that can be used with a scalar variable.
> +    The type of each object that's contained in the array is also fixed for all elements in the array. You can use any of the assignment operators that are defined in [Types, Operators, and Expressions](dtrace-ref-TypesOperatorsandExpressions.md) to change associative array elements, subject to the operand rules defined for each operator. The D compiler produces an appropriate error message if you try an incompatible assignment. You can use any type with an associative array key or value that can be used with a scalar variable.
>  
>      You can reference values in an associative array by specifying the array name and the appropriate key.
>  
> diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> index 607c8f0dd..28b3001ae 100644
> --- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
> +++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> @@ -325,7 +325,7 @@ The built-in variable `execname` references the name that was passed to `execve(
>  fileinfo_t fds[]
>  ```
>  
> -The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md#).
> +The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md).
>  
>  ## gid {#dt_ref_var_gid}
>  
> diff --git a/doc/userguide/reference/dtrace_command_reference.md b/doc/userguide/reference/dtrace_command_reference.md
> index 90209d123..2c45d8e4b 100644
> --- a/doc/userguide/reference/dtrace_command_reference.md
> +++ b/doc/userguide/reference/dtrace_command_reference.md
> @@ -3,12 +3,12 @@
>  
>  The `dtrace` command is a generic front-end utility for the DTrace facility. The command implements an interface to invoke the D language compiler. The `dtrace` command can also retrieve buffered trace data from the DTrace kernel facility and includes a set of basic routines to format and print traced data.
>  
> --   **[About the dtrace Command](../reference/dtrace_command_desc.md#)**  
> +-   **[About the dtrace Command](../reference/dtrace_command_desc.md)**  
>  The `dtrace` command provides a generic interface to all the essential services that are provided by the DTrace facility.
> --   **[dtrace Command Options](../reference/dtrace_command_options.md#)**  
> +-   **[dtrace Command Options](../reference/dtrace_command_options.md)**  
>  
> --   **[dtrace Command Operands](../reference/dtrace_command_operands.md#)**  
> +-   **[dtrace Command Operands](../reference/dtrace_command_operands.md)**  
>  
> --   **[dtrace Command Exit Status](../reference/dtrace_command_exit_status.md#)**  
> +-   **[dtrace Command Exit Status](../reference/dtrace_command_exit_status.md)**  
>  
>  
> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> index 6fd0fec6e..70fcb583f 100644
> --- a/doc/userguide/reference/dtrace_providers.md
> +++ b/doc/userguide/reference/dtrace_providers.md
> @@ -3,30 +3,30 @@
>  
>  DTrace exposes different providers that publish probes that are grouped together for particular instrumentation or functionality.
>  
> --   **[CPC Provider](../reference/dtrace_providers_cpc.md#)**
> +-   **[CPC Provider](../reference/dtrace_providers_cpc.md)**
>  The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
> --   **[DTrace Provider](../reference/dtrace_providers_dtrace.md#)**  
> +-   **[DTrace Provider](../reference/dtrace_providers_dtrace.md)**  
>  The `dtrace` provider includes several probes that are specific to DTrace itself.
> --   **[FBT Provider](../reference/dtrace_providers_fbt.md#)**  
> +-   **[FBT Provider](../reference/dtrace_providers_fbt.md)**  
>  The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
> --   **[IO Provider](../reference/dtrace_providers_io.md#)**
> - The `io` provider makes available probes that relate to data input and output.
> --   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md#)**
> +-   **[IO Provider](../reference/dtrace_providers_io.md)**
> +The `io` provider makes available probes that relate to data input and output.
> +-   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
>  The `lockstat` provider provides probes that can be used to study lock usage and contention.
> --   **[Pid Provider](../reference/dtrace_providers_pid.md#)**
> +-   **[Pid Provider](../reference/dtrace_providers_pid.md)**
>  The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
> --   **[Proc Provider](../reference/dtrace_providers_proc.md#)**
> +-   **[Proc Provider](../reference/dtrace_providers_proc.md)**
>  The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
> --   **[Profile Provider](../reference/dtrace_providers_profile.md#)**
> +-   **[Profile Provider](../reference/dtrace_providers_profile.md)**
>  The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
> --   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md#)**  
> +-   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**  
>  The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
> --   **[Sched Provider](../reference/dtrace_providers_sched.md#)**
> +-   **[Sched Provider](../reference/dtrace_providers_sched.md)**
>  The `sched` provider makes available probes related to CPU scheduling.
> --   **[SDT Provider](../reference/dtrace_providers_sdt.md#)**  
> - The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
> --   **[Syscall Provider](../reference/dtrace_providers_syscall.md#)**  
> +-   **[SDT Provider](../reference/dtrace_providers_sdt.md)**  
> +The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
> +-   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
>  The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
> --   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#)**
> +-   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
>  Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
>  
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index 40903775d..6c1fa8ecf 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -130,7 +130,7 @@ No fundamental difference between a process and a thread that a process creates,
>  
>  ## proc Probe Arguments {#dt_ref_procargs_prov}
>  
> -The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md#) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
> +The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
>  
>  <table><thead><tr><th>
>  
> diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
> index 68bcdf715..f6d183708 100644
> --- a/doc/userguide/reference/dtrace_providers_sched.md
> +++ b/doc/userguide/reference/dtrace_providers_sched.md
> @@ -245,7 +245,7 @@ Probe
>  </td></tr><tbody></table>
>  ### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
>  
> -The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
> +The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
>  
>  ### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
>  
> diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
> index b721f64e6..766709af2 100644
> --- a/doc/userguide/reference/dtrace_runtime_options.md
> +++ b/doc/userguide/reference/dtrace_runtime_options.md
> @@ -5,19 +5,19 @@ DTrace uses reasonable default values and flexible default policies for runtime
>  
>  Options that can be specified when running the `dtrace` utility can be categorized into three types:
>  
> --   [Compile-time Options](compiler_options.md#): affect the compilation process but might also affect runtime behavior.
> +-   [Compile-time Options](compiler_options.md): affect the compilation process but might also affect runtime behavior.
>  
> --   [Runtime Options](runtime_options.md#): affect the runtime behavior of DTrace but which are often set at compile time.
> +-   [Runtime Options](runtime_options.md): affect the runtime behavior of DTrace but which are often set at compile time.
>  
> --   [Dynamic Runtime Options](dynamic_runtime_options.md#): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
> +-   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
>  
>  
> --   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md#)**  
> +-   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md)**  
>  You can tune DTrace by setting or enabling a selection of runtime or compiler options. You can set options by either using the `-x` command line switch when running the `dtrace` command, or by specifying `pragma` lines in D programs. If an option takes a value, follow the option name with an equal sign \(`=`\) and the option value.
> --   **[Compile-time Options](../reference/compiler_options.md#)**  
> +-   **[Compile-time Options](../reference/compiler_options.md)**  
>  Compile-time options can control how DTrace programs are compiled into eBPF code that's loaded into kernel space.
> --   **[Runtime Options](../reference/runtime_options.md#)**  
> +-   **[Runtime Options](../reference/runtime_options.md)**  
>  Runtime options can control how the DTrace utility behaves.
> --   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md#)**  
> +-   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md)**  
>  Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
>  

