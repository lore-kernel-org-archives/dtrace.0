Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B4233D93
	for <dtrace@lists.linux.dev>; Fri,  8 Nov 2024 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731090637; cv=fail; b=O4Tf9mpgu1k534KSRhaDfwwH0HbtQBjemHzrqMI846QeXk8fCE49PKq8gXoyJAP30K5CDzc5jJKG1M5QwoCirEokwz8hcuauHGv/ZARork1lMuyD1x9OqYTKPwqfuZUu3Yh4hphl+WHIiPU87QTv8P8NqE1znzregXX8+s/pyuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731090637; c=relaxed/simple;
	bh=t+eBMrliSYLKU3M4ugr1WNXi6gpUyVT2P98D/QO8p78=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a60PIcKiwRVTDUyrfunb4sPnwGSPxVNlUOZ1CGfqe/9XZsL7cPuMvgI2HhhRrzYnSVgA+jZWNgBu8NFQpPlljS8sDzD0+y8o5r/6huRUiJDETd46jm4WfyRNZ3o0wEc/+ZsOCaqYrcrAOQyR+4tNiJLCGbxNzhlUrzQMEKX/5N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D8oSBE7T; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YoOEqAtp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D8oSBE7T";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YoOEqAtp"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8FtZUd014761
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 18:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=+Z8dAuX2khOKKj53XSRmHSDX3vHR8AwkDAfhMMb3yUE=; b=
	D8oSBE7TOQj2CIlKuikDCS8nLdhWGNSlIvSwlFuK1gnjKvP+Y6ClNSP+qvPcwShp
	hfayfNxJG83ppQ+M6qbjC5nBY7RpsqmlUFN/nBFJseyvtrxgACEYrpSsd4P8xHnz
	RoEYKhaUspBZ4e2XWWx1nGrPd3PuwuMb/U1modhd+XpvO3+im71/Qr10GQdOrO7w
	pigh3BGUXg5YsFUPbBd5s1DLDJAI/oBEICU4axrpVsrF7VfdLmQYJDXCTFfOnB1n
	R0mO+xg83WnaUkyE65uo2GZ9XmYq8VPfjjhf6EVpJX/7wve/kFv7S0LGFI9V+bNO
	m7fZXOKQRAPFCJuqZkZR1w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6ggt3m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 18:30:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8H103h003518
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 18:30:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87f57dn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 18:30:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaJMwQjd1tHgbzivrpDvLKUopCHPZEX0oyugBhd/4fkmrtFzRtgxZUd0Xu9FcJNrrQaL9DOEPSIwAj3IZlL6yxd7X+YxIu9WWoHkbg8vkwoRJ48t5p3c5siF8K1K5GZsMueGO0Kz0v95XgGQeAHJrZoo9Z//fgsxsRmimkpldyJI2p5Xw/WrAbH57Tieg/5pvwqY6kWqWtB9E2ykG1QzV2YY2ZJ5c/PeeXvn2//LeSRkOFreMayfBexWRk0/A/wYRNj8W6S1FNdqVzW2HXyQDlDb3+n+Z8uhco2K5EH5RhCn540R6EPDZAgDIw3LO1xTz0EAPP2YMOdNtKWrLO+Lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z8dAuX2khOKKj53XSRmHSDX3vHR8AwkDAfhMMb3yUE=;
 b=yksCZGRRiRoTkM/SOUkdKhmIUMe8iBNTIZLH9gXOq5daH4yQCBwMTgAXA0AjyJZBHhqO25k4CW6Tn3mWF6++rXbo/U6rAQODnSFZDexeErXKgJsA94Z4zLbp6rgUHhsiJPdwSPM88t8RIMmhWP56Oc3qbJl7mOW+4QsA0kOfdNljxXgUfYJ31RK+bKCanfGCErovJlDx7I74fkHdbIuuJdcCpgEjzsi086JHjxGE6uz13sZSVOwzbfhokV5ovQuvt/WDyszBYO/FZi0qEqslcPDWjlcYFBer6qK3GcAJHFWR+AH04ssBTAlVgF+LiK2tEktqHnZ98JVu7a3J+K2ybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z8dAuX2khOKKj53XSRmHSDX3vHR8AwkDAfhMMb3yUE=;
 b=YoOEqAtpj9YGqaFfQldaVhtUKdgPuXs99y0UD/B9oSDZzWp09w1MnaFkvdXwSbf597ffptK3gxrCS64IqgufBSaCxgohcaNs2Eod68DeSn4vqWsWFKzu5GO+NnFLAh1n1VinPuTvmbtY/sn57oAUsRT9Vzjm2avV6dk4Ekao2ZY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8189.namprd10.prod.outlook.com (2603:10b6:208:4f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 8 Nov
 2024 18:30:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 18:30:30 +0000
Message-ID: <7a85ab3c-a335-1248-069c-d5600f2ac427@oracle.com>
Date: Fri, 8 Nov 2024 13:30:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v7 5/6] usdt: new tests for USDT arg sanity with
 overlapping pid probes
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241106112942.264351-1-nick.alcock@oracle.com>
 <20241106112942.264351-6-nick.alcock@oracle.com>
 <c7e23550-b87c-9750-e17f-20b7b060854c@oracle.com>
 <87r07l7tsx.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87r07l7tsx.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0167.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfbcd14-1aa6-46d3-77dd-08dd00236caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGdkamN0VGJlZDdIdWl4dmp5Q1lGWFlIREt0ekI0VGZBa21tbG5ab1ZCRS9L?=
 =?utf-8?B?SytIR0JOR0tESWhaQndoQUJXZXlvT3RmZGFUbVpXeFUzZm9BWm5qb203QnFp?=
 =?utf-8?B?cTVVSkFxWUV4ZFZjNzVKMGRDVkZjT0QzWEVGRGxHaDZqUWlQMjJwMTh6Q1Ux?=
 =?utf-8?B?VWsvay9FMzBTYm5VeW5lMzJKNkdLUWpDRmZQeTQ2UjBuN1ppNEtpa056dExi?=
 =?utf-8?B?RFBqRCs2bVJ1QWNVeVpUWXJYNFAxcWE3UjFDQkNDNHpPL2FWVElnaHRBU2pC?=
 =?utf-8?B?VW1jblR5RituME0xQ3ZPcmdkSXA5UVJscXBFakpqZXRKSzBUNE0wRW9lSjY0?=
 =?utf-8?B?QUNxLzFxYVhkYVliZkljbm4zc2lpWGlBZFR3cDlaUUNvQzRvR2pDMXM1MmxW?=
 =?utf-8?B?NmlBRXlTTUxkR1hkdWRtSEh2cTdFZzc1cFJCMmVBeFcwYm94UjU1am5pSXJl?=
 =?utf-8?B?dVlpNVZsNE5rcU5JWGUrWk0wOHpxOGFRbmc2NkVmZCtYd0pBMS9xRk5DVjFN?=
 =?utf-8?B?WHBQQlRIK3VGSHZSdGFtSjdURXBQdzBJU1dlUm41cFJHRUUvSThkUUcxdFdU?=
 =?utf-8?B?QStQTXBXOWQydmlYdmRiVHZQMVA0ay9Va1ZiV2NJSUd5UktLMURKSUpnRGFy?=
 =?utf-8?B?UXgxeE9lVWlkUDJCT0xXR3V4L01OaEtFQmRrN2xuVzYzRno4alJmYTQ1Mjk4?=
 =?utf-8?B?ZFFLdVVWR1JScHpkTVZlNkRRcXkyRnpxVkc3SDM4QnJJMU5nVk50N0JrcFlD?=
 =?utf-8?B?dTJjTnhkOXB4WlovcmZ4Mlg3WmVvNjA0Y2g0TWVLcWcyV1pjMnNQRnYxQWkx?=
 =?utf-8?B?L24vdThzc2k5WHdHZGVwV2VBZlFJNXlkeHB2Z2lxeGd0T3N2VUF4clhOcWlK?=
 =?utf-8?B?TWUyUEFURUVZY1NMeVMvWiszT0M1NXRvaDdIVEVKRUZKYUpuTkwxRVBZeEV4?=
 =?utf-8?B?b1Q2dWZnN09XbmZoM1BmZjVVYXFaZmpCRjhJV2Q3TW9YUWozRkZrOGpXQ2pQ?=
 =?utf-8?B?UDNmaGlsbU11dHRKalprU3ZVYWNSRVBpZWQ1M1ZUcnpiTDF4NnVkbzFBalV3?=
 =?utf-8?B?YnVtR1ZyT2FCbkRoeEE1bUJMdjJqTUF1U3VjcVpMSUwxc0tGTDRWMWQ4dWlS?=
 =?utf-8?B?ekhlSWlaZWhJbFdVSWRidjVBUTc1YkxOSU8xNmxTVlc4UFNaUlhiV3hpQmQy?=
 =?utf-8?B?dFBXbVhOU2Y5SFQ3VmdJclRCdGdDNkVpOG04bGhxQWN4V1ZOcHF4S2xIaVVX?=
 =?utf-8?B?YTZ0aWg0UlBza0dsdzdJTmJ4L1Jsd2ViNWlPS0k0MUJoM1J4VVdaOEtSWWp6?=
 =?utf-8?B?RU1DS3VVZFdGeGNVVWtmeFJzdWlKSWNtYjFIWUYzVEhqWlROUzF0ZDM4RC9J?=
 =?utf-8?B?YlJNcjh1cDd6WHJESCttdjNwZFZTU1MzRVBhZVgvcFZuekpPcTYvdjZtNFUz?=
 =?utf-8?B?NEw4amhkbTQ0eU13cEsvckdxbDFoRUN0VHl0ZmxDeDM5dXdQZThMY0drTGJL?=
 =?utf-8?B?a2VSWGYydEswQ1I3bC9NYm84d09FV2RmQ2xYWGowRmpPMFBqd3VOeGUxRHlz?=
 =?utf-8?B?SDdLR3dJWEZOM2lWOUVOQStNOFBsamdNZ1VTVVBZRDZ4LytEYThGbmNVL1ZZ?=
 =?utf-8?B?RXdQS0RlbS92c2hrSG9ib3RmR1l2eTUxQjNHT25udStWZlhNb3NvL3FhYTlv?=
 =?utf-8?B?bnowL2IvR3hmeVhyVnljZGJHWWowNUx0Tkc1clRIcUVrc01MUnM1VzdaVk5z?=
 =?utf-8?Q?2p4Vvxxv3tP55TD1w5jydmaJBgcQYi1ipEe9uQs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzBlek5RN1JYMkt3cE9LdlpzOWt1Um16VksyY2ZUZGhZSTl0aCtSbGdDZ0M0?=
 =?utf-8?B?djVGS0E4NnhHdzg2RzEzSzFkWTJqTEczbG13dWc0cVVjdlB2WS9oZFVyTTQw?=
 =?utf-8?B?dlk3M2RGWDhWdEhzTHp4SnRXK2dDM2FpKzJ3SWNUditDeHFtaHc4elRlNEVQ?=
 =?utf-8?B?YTVRdVByOWNtQnl3N0Nwalc3K0VKNkVHZGExeUcvSk9DLzJBejRLaWh3Z1dq?=
 =?utf-8?B?cUd1SWVDdkFvdDkwV1pyYUp3aWdrNHlPMitBRWRFQjV5SThod2QyQ1pGWlRn?=
 =?utf-8?B?aDM1SWU4Yi9SSmUwSVlzTEV0bEZUeU1KeEV3VHkyU1hoUzRxK3B0bHdBVEV5?=
 =?utf-8?B?cTZGRDRmVWN2aHZUbXQ1Wk5RaStsUjVKcEhMUkY2Z1EwZjdIbFdtZEhUQXlK?=
 =?utf-8?B?UlVkSjBSb1hqR2w5SGJhcWZOZ3hyaisrbnZ5eE1ucG5HQ0JtVDRFejY4cnpt?=
 =?utf-8?B?Sjg5d0ZrL01aVE5XaWZtWjBUbVF1VFhZaVNtOVF4MURROGdRcHFvVUVGWVN0?=
 =?utf-8?B?amNncWJvUlVEaU44R3Y3Ynd6d1VCS2cyMU1RdkVRaUFoMG0zRmQ1OEFBY1pH?=
 =?utf-8?B?VDN0OC9qaWUxK1NjcTM2bEpNRFgwSXZvU1d5eERUSFgwWFFmWHM2OTZGdHRx?=
 =?utf-8?B?VlZoV3B5RGtTbTdWUDlqRld6cTVsb3ZmMCs2anJBQkVsRG9jZXJpNUJ4VUwx?=
 =?utf-8?B?S1JzNEl0SVdYcTEvMTI5ZThjQlRIZ3pKWkQ4TlZZcmxqVXNKUmRQdEk5Lytz?=
 =?utf-8?B?SnIycXFJY1UzL2QzcmgwQWYvOHl5bHNyTmFEdU1LaHdmUHFadUJsQ2lFVFh5?=
 =?utf-8?B?b0xKZmhhOEMzSFVPL1hvekluQ3lDdkRVK3Q3VFRMVlNyVWlpTjAwYlNtMHhm?=
 =?utf-8?B?b3ZsZWlOczE2dStvWTlJZzJuU1pFcDJUejJSdTdVVXdOaE5qalVncGsxZjZL?=
 =?utf-8?B?cTA4Ym02cFVMTEhBTk9VQXZOeHdlVkhtWEZzeUdjRjZETWNkdkIydjFFKzkw?=
 =?utf-8?B?QmtJYXg0a2poZHN0YTFkQTdGNTVaRThiLyt0ejdBNVhXNEdHbkxGNXBHM0g3?=
 =?utf-8?B?bWw0YncyQWR5UDdvZWwyZlU2M2o5VGcwMlBGZmlvbjNZVW00VGhteWtXNGJr?=
 =?utf-8?B?WDdFdE5sWnZLSnpoZjhOSjVDRWg4Z1dpcmZ5YndMNDNOZkkvWE8wUHNHZzFm?=
 =?utf-8?B?T1BualVCcWR3RWU4VDArTEJhYWxJd0FXRFpVSmZOOTlXM0RTNnVQU0VpSUNG?=
 =?utf-8?B?MjZDVGNMRXVuWU5wQ2dxUjZ0aDlBanBMbXFNclUrL0wzdGhlT2xZVEt1WE80?=
 =?utf-8?B?UVdIR2grcWdRWlNXQkFycmZVYVFQalgrWlFPVktWcG1ITFdlRExmWjVJMTEx?=
 =?utf-8?B?RWJueVNyeTd5NFh1L1lNSWJ3ZGRyT3ZidmlJcVFsYlRFV09IUVNGeFdWRHVl?=
 =?utf-8?B?aEhLcGtkSU9sMlpsdFhUNmN3WjBLSldGeitVMGEvYk50ell0VXFRZmN3SXJQ?=
 =?utf-8?B?bG81MkxNTXpPN2NEbGhjSVVEU3d4cTdGWDZMV3RxR2NBSG1kRUJsT0dPby9L?=
 =?utf-8?B?NndtcXQ4U2ZLZXMvQ0h4bkZGcWh5UDdES3lSRkEycllqbUFMNmkvak9LVktV?=
 =?utf-8?B?dG1MbmhuQlY4U0NUYUt3NFhyTS9LVmZGMDRtbjVOU0pMbTd3S0NFeTJaaFJN?=
 =?utf-8?B?UmZLTTArWjNoL1E1YVd0VjRjTm5CY0xDdC9aYjAyZVhmaGNQV3lwVllVN3Bx?=
 =?utf-8?B?V0lwMTZUdUk2ZUs5emFQaER6UGt3ZW9zZ2xhYVM5eGJPYzZ3L3pBTGo2Qi9T?=
 =?utf-8?B?UXdmK0NXdjRWbmJPWUczVytBZ2FUakN5SVhmTHk2TlRNcWl0KzViUCtxZmc2?=
 =?utf-8?B?c3d6Z1d2NVo2OW5yN2lTQVpnUXFVbnJwb29HdlllNUc4WndocTc3WTVxSkJO?=
 =?utf-8?B?U05leDhIVTkrRzMxZEtKMko3UkFoWWVlb2lMUjhvZExJUU5QUEtQcHhkMEVB?=
 =?utf-8?B?YlNaZEZHakt6UlJINngvQzVwUDQ5QTA5WHA3MlZDRjU4QXZXNThqYTVGaXo3?=
 =?utf-8?B?Q0JsUHc3bGhtR01RNXBONTF4eW9BR2hlSVNGMDlCTEhKczFJVUdsaEdTNzFK?=
 =?utf-8?Q?AmuYhJ9YFpA+tPnOxxj5OREkN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+wNUDoPMSPsRwuy++SoAnc47PbizX+e9hQeG/NPDq4bQKcPpwjot0h+cmBJyvstomwC/MN6CI7Drz4hszu9PtsvHq9b7zlxwctyTg7jIRhRw0UKus9ddiFRZfYRrxN4J1lYxGvxpfLxNnLvJOxL2HlGfeCBW140YDivGGgiq2y4eHyttz7SRU+gUGnaapI93caljOvj+FZrNL5tEEgUD7s1+bR/sFeyAUPUgFJbNQXe5lmwxTXzzjuUzgfS9kdZhwc3eRHt5JNLeQN9Vm8xAySbterNN3rPJPAIY8gt/jmndbj3DS2ZYKdJYJ+1j+xvJpgeiauSW2WyMWoZGxh717iIYC1OhNwon/8RgjwUAAcYni48qatRu8wt+y5OHJKWRNeR4iraFpNDSmg+7HxL7ecKx9wfTfaDafByLtV+R6h9/hgegi6YYnCC45hZhTtVU9sWt/MJ2/IZztxgCDaMNI3oEWUS9U5lehxdEIUKesE5ZWsTBnmBN3XBUQH8CBDkhlHyH3A2X2FLVBeRSkokkzBJ69+yYNEKtjYoEcFdZNIh8dccMLV6Lf9cciE4DwTBizIZW/xcyR2eYWkLmsMp74rPJ3GA7f2amE1YBLL7I6Lg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfbcd14-1aa6-46d3-77dd-08dd00236caa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 18:30:30.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJRbQtPnd4biD4q+cSyDEEh3XBDLiu86NKshwegcAmjp4zkz4MycJ9T9r0Bx77jr25lBQBRQn2/0inBz1aONHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_16,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411080152
X-Proofpoint-GUID: LVwYxpPtn6xH1fEb6E5fhkGeihwsy1I-
X-Proofpoint-ORIG-GUID: LVwYxpPtn6xH1fEb6E5fhkGeihwsy1I-

On 11/8/24 08:13, Nick Alcock wrote:

> On 7 Nov 2024, Eugene Loh uttered the following:
>
>> On 11/6/24 06:29, Nick Alcock wrote:
>>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>>> ---
>>>    .../usdt/{tst.pidprobes.sh => pidprobes.sh}   | 56 +++++++++++++++----
>> Why the renaming?  And, will "./runtest.sh" run pidprobes.sh without any command-line args?
> Nope! It's a library now, called by tst.pid*sh, including, uh, the new
> tst.pidprobes.sh I meant to keep around and call it. Oops!

"Nope"?  It seems to me that runtest.sh does indeed call pidprobes.sh 
without any command-line args.  It looks in test/unittest/usdt and sees 
a .sh file and runs it.  The fact that the .sh does not start with 
"tst." is irrelevant.  Indeed, we have lots of tests that do not start 
with "tst." (nor "err." nor "drp." etc.).  So if pidprobes.sh is not 
supposed to be run by runtest.sh directly, it has to be hidden better 
than simply by stripping tst. from its name.

I suppose there is no harm in runtest.sh running pidprobes.sh directly 
(with no command-line arguments) except generations from now someone 
will be wondering what it's supposed to do.

Incidentally, there is an orphaned tst.pidprobes.r file.
>>> --- a/test/unittest/usdt/tst.pidprobes.sh
>>> +++ b/test/unittest/usdt/pidprobes.sh
>>> @@ -5,9 +5,12 @@
>>>    # Licensed under the Universal Permissive License v 1.0 as shown at
>>>    # http://oss.oracle.com/licenses/upl.
>>>    #
>>> -# This test verifies that USDT and pid probes can share underlying probes.
>>> +# This test verifies various properties of USDT and pid probes sharing
>>> +# underlying probes.
>>>      dtrace=$1
>>> +usdt=$2
>> Why is there a usdt=$2?  It seems that usdt is always "t" and you'd expect that in test/unittest/usdt.
> Oh crap. Sorry sorry this is a bug -- I lost the tst.pidprobes.sh I
> meant to add back. Will fix and repush this patch.

The patch has perhaps already landed.  So, a delta patch might be needed.

> -- which reads, in entirety
>
> exec $(dirname $_test)/pidprobes.sh $1 "" ""

Or, just let runtest.sh call it directly, as it does anyhow.
