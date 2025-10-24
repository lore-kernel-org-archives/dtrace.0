Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5D3043CD
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761294304; cv=fail; b=Nz04YG5d/jR/rMeDlA4T6RQs5KqIHsTwhKWctOAC1pFz366vuCvBYswoDjwR47RSvrpmxtyMG7FzVDspoEL2y+RaQuD5TO/HRU65sDay4TmxTcDLJuTHVLPAkOW2Mi7V2hOLthN5+9LkloEP91s0hDOVBHdR0JJ75BM5shvK0do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761294304; c=relaxed/simple;
	bh=irXA3OxLt0c0SO4ntulZQnTMFnchQOpRIGt+3kq8oSM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rRA+Ji/ZmLnd27Bk9iyRi3HHKZ/mc/nhiLHZAHjv3sXfIashUbRoT6u2txUhKPuX74tUZGxuWun5NGIDki0fciSfGApzOg7lmwLgN1HoBnJu4u2J8raaJkHqaKPDoSCbkFEB99+GKvOzl0xQ/po1/Y10Hec779+wjyTnLUYUYZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r2giKPoA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OsIbHT0V; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r2giKPoA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OsIbHT0V"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3NiDE006315
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8xSgCP80Nm9QOSUd5KeRTlKYxsSLEhQDFAIo03KeYN4=; b=
	r2giKPoAqRQgF8mSkqncMoJDp4TuCQXB+mUZIja6SZgNPQ+iHucLlW2ElLJd8F0Z
	OGsik84xPjpKCooqF6URhGuM4PY7mbBX5wk+XPRPiJmoRmXsxnTo/L7PXrtp7jCt
	ax5Rb2nDK3vnPzCnGwIMX/RpBLpyKJCMSbsn2X6qC8HNmatyhB4Nehukf+j8A5TY
	K2RviQ/95a+Q/231Zp+ptEKNVe3GtpOTgsJ6OKc3dMJXTO/AhbYnXrB0LowtbgGz
	hFl2JK0DgEg11fS5c8p2HXiFroIN2M+DxREJsd3VmalMzAOcyQ56CPwd+d7PAKCq
	ut+rnU/2FhfY2AojDnPL+Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv5wm78a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:25:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59O7WQhH035638
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:25:00 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bgnc10-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Oct 2025 08:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJ3sY3Vaw/I8aTBVnX/M734AbMEr8EUIAQaFgHz7GREO75zh7s/mANecaGeeVi0yt7XRblWv/FQ3mC40jY7fcUTlf5idK2fGn7LqPOkI5Y3XOw1PeJ4u5dw77I5PuqjzKUTT2hB8in2XKqI5jMGiQ6Ahw7jkc8kobbi8g2zdk9CTgzpbXzYztqH0NhF4oLwZxCA3sSzTLBTwffostRWEE7bgL8ImYI75B7dn7BmyxF/ofu+Q8mlod/x8wUxJwREIdU55Tmr0RI7CceL9A4pH0oPyHFabPib7szGRy6eebv6tJYFhSPOFw113VvK/wKcygxuU3yP8+Mb6NDPzWRbGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xSgCP80Nm9QOSUd5KeRTlKYxsSLEhQDFAIo03KeYN4=;
 b=xa/a5tCF428A0JHU8hESLafdvL8RuJSMGVJhhvvWMHMJZbuZL26AT7BtHBGSI02nbWxz71phQ6Ey5aJhXXpcDnpQ9LY4DdmiRjWH9WaM767puaMU0RxKvS/qOhUdB50iiyVLjoG/Hgc/IUN6mkebbpbL4lGY92nlhBQuvUIWWCf1fObrmrFX1sAM6YNiohOQwyx1JVJMYqQpO3TupVR8VfZ2FBN22Or0Goc2vILCSb+6vGwtMzSm+UCwm4kx2KjAiuSZH6oHqT/RjgyI/o5SkteKsLheaK6qCiZ3XEXhUj3ZQnUufqyhc1VTqWcRIk7IB5mza9oJI/j1KPPoo34+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xSgCP80Nm9QOSUd5KeRTlKYxsSLEhQDFAIo03KeYN4=;
 b=OsIbHT0Vl5ANwm+lzgtSzGrD5aqtCX+2Acb/4CjYd7UyplmaoMuiO4sggTod5jSFOZCUTKDDNM6wPn1ds7ducvnboNjtKunzA34UMmFmom3IkW83zYkMdq7sTvGS1YKm//T8k/S9oHAeaaO+Z6iXGaT1ta6vskQ00gJRcZlr4m8=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 PH3PPFE7CE61147.namprd10.prod.outlook.com (2603:10b6:518:1::7d5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 08:24:54 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 08:24:54 +0000
Message-ID: <db75cda6-b552-4120-9d9a-28084ccf10c0@oracle.com>
Date: Fri, 24 Oct 2025 09:24:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/20] doc: Add TCP provider documentation
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-18-eugene.loh@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250926190557.8485-18-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|PH3PPFE7CE61147:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb56465-c23e-41cd-2433-08de12d6cf19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTVLSWozSHlrRlVRejBsYy9nS1A2R0pFSEpraFhJd0lQWUNDQ0RBcmRqc3N3?=
 =?utf-8?B?TzFQdnBod0tsMkZFbXVmUlNOdC92RkNpbCttNmNIUDk0RHQwZ1p0bXRYQ0Uy?=
 =?utf-8?B?cmQ3OUZ5U2ZZV1l6OEhOZG80VTVmdERxWHJlZFNDQmR0L3NDNXdsWmZ6VDJm?=
 =?utf-8?B?WTNac3A4QkhJRTBZSVF6clBuL1JWWVFjT2ZUVlI0NVVSYjMvT0Y4a1hmU25I?=
 =?utf-8?B?MFVNcDFZd3gwQVI3cE93eFZaOUc3SkhsRjNZY0tPKy92ZjB2NGFDd3J3RTFC?=
 =?utf-8?B?MjZlazl2QTBhb3V3clNwT21aQmJua0ppaktpWGV4MFBGTy8vSENRMzFobWFr?=
 =?utf-8?B?bHd5dTh0QzdTZHlWejVMSnpOL0JURVFrcG5IUWFXelgyejlGM204UHR1V2hX?=
 =?utf-8?B?cktWelB4Z256d1FMdVFJN05meXRtL3pLUm1BUnZoREhWUUYvWDBveFRhdTB2?=
 =?utf-8?B?K2Myc2RpK2FYZEZ6aGlYbG8zRkk5dEVZNTFOYk5iMlFJRkt5eFFsWVZsamta?=
 =?utf-8?B?aFIxNHVsZmVrSnBkZmtNaFJOUjd4RVJHL0N0OXdaUDllTkUwSGlwQ0MwT2Nk?=
 =?utf-8?B?b2U3b0Y1RHNCdGZwMGk5d24rTjM4SFdpRG5uWjl2Vk9HWjF3dGQzbUFJbXBq?=
 =?utf-8?B?RWpScHBYYmN2eXBMeTJ4WDVCakQ3d3pSL2g1Tk5sZW02VGR6UnhtdGdkbHZM?=
 =?utf-8?B?V0RjOHlEL0NzYTgxd2JGc0dyaVhyMVRwUm9TV1I5bjlIbkxwZDVIOFNlbGRP?=
 =?utf-8?B?cU9pSzVZamRMMjNPaFUvdUE4U1lJVkhLL2RzeWdsd08zRkVvczZXVExEcFRG?=
 =?utf-8?B?cUZUcy9CVE5kN0llcGp3NFJOTG5INmU2c3RTYkJYcklieVFCWTdRd1cwZUR4?=
 =?utf-8?B?MVVVaHNjOXN0cFJRcUplL1NDd1B0czRQTlhkUjJORmV2Y2pNSVdtWkdyQ0oz?=
 =?utf-8?B?N2hrdmZHVWVPVW5HN2dkYlVLOUUyQm05ZVJFQ2poc00xY0xiaTFzQkNPSXpk?=
 =?utf-8?B?bGoxdXJZeVVVblkvclRnWUcxNmNkOFg1V2tRdlhrRnFYSGh3MmxEZEszRVhS?=
 =?utf-8?B?OWFiQXdyaWc5MVNBVWxjRldhMEpVeTVlS1ZaUUNIYmdHV2lRNVBYOGgrVnhh?=
 =?utf-8?B?bkNXQ055UlBEQTdXSGpWZUdCSU52ZTk3d1pCNE1acVR2Y3E3R1FtUkVKZHdi?=
 =?utf-8?B?RkxuUTl2emlXRkFCUVZLcTZDZFBENzNMSlBMSVNSNEFBa011emxncUpzQlB4?=
 =?utf-8?B?WmNCSmx4R2JhVllYVElEVzMxQ084NExFRURaUXc5QWZGQmxZeGRKdnhXeHBO?=
 =?utf-8?B?YUc5cVhqWUU0NkxXVGo3Q0o0R3g2aHpaL0s5QVhoczgxUUNqSkR0VGRQeWx4?=
 =?utf-8?B?QTY1VGJTdlZjTUFFbHdOT1JRN0QrQloxOG1EdjNhSlQ2c1JXczN3c0tUVjJR?=
 =?utf-8?B?WWpXT2NqaS9odHdlaEpiTE1TcFRRc3FHUmUyL2k0eGUxRVRqZS90TDJCdkFr?=
 =?utf-8?B?RmJRakM0L25YS2Yxb05XSGNPK01hWVo3QkNIQ2ZPYktPQ0VubVFDQnVBOHdC?=
 =?utf-8?B?VHRVbWdmNEV3QWUxMWNUc2R4a1dQVXYxeUltTTBoMHdrTmI4Tm9LRWQ5VXRq?=
 =?utf-8?B?b0g2bjdWcnZFS1U5eCtEenZMN0VNa1ZONmdpdnVVanlGb3ZxUkwxdXhGNEFw?=
 =?utf-8?B?M1BmaXp2ZFBPYzJ6RlVWQUlGS3EzZ2lCeWRCVU9ncFBVL0RuekNQSnBGUk1B?=
 =?utf-8?B?d0djeG9HYVVGUnRtNmY5eEgxV21mSXdleEdZTmJOSXZCYUk1QXF3Z0ZDUUxK?=
 =?utf-8?B?bkZqYWpwSU0zeVdTMi9abXFWNG9CdHc3R2U3ZFRYVlBURGwzY1hkMnh2R092?=
 =?utf-8?B?U0NHN1BBTmFhV3BhcjFjVVVBTmpKOSt6MXk5V3pkNGV6YUpEckFaZjhMZXhj?=
 =?utf-8?Q?QEH4R2svid5wG7jl5FDT8OSqrSnfO8s9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmo3MFpzZmhmWmVOQU80OTNsTFlMK3JuQ0g4Z29tblFzYi9TZE9FMTRnT1Uz?=
 =?utf-8?B?TCsxTS9lejdxT1E2a0MwS3dHTy8rbTBnUUpZN1NwdU5ZYWliNWFLcDVOYlg3?=
 =?utf-8?B?THlON1ZLajN2bWpOOWZTM0pQMHNxUi9FVWdvSkZPVWdpR1JVZWoxREpRYytl?=
 =?utf-8?B?VURPalhXRk1PaDZjT2RlcHBFTGF2MXlRR0Q1VWpMaFpNZEJ4UmlMcUlFOUlk?=
 =?utf-8?B?V0V4Q3JLZFBjajBsSmdScGpaZG1qRFhPRTM3akhUaU40QWx5eDNBQmRCZFAx?=
 =?utf-8?B?a1JBUit0UFF5Q21hSTQvdmk3QmdTbVdUYU44cDFDSC9KUytKa2dhL0doMVI0?=
 =?utf-8?B?NUFwL1hLNC9zOU1KdVVPOHJOSWVpKzEwOENmTTN2NHJQV0Q4QlM0TFQwbVlw?=
 =?utf-8?B?ZTByUVR1Z0RLZkp1S25Jdnhvb055YmZFTDZrTDFiVHVXdXkvcVc3d1Z5ajNt?=
 =?utf-8?B?NCtQVFY1S0pJSzNxOGNEUk9jc292eW9NcDFCc01nWWc1VHdtUndGOW44QWo2?=
 =?utf-8?B?aysrazNJTDlsOVhXYlhWOTQzVTJycWV5c1kzM2xaVTlIa2VEOTF1dzZ1aHJh?=
 =?utf-8?B?SDI3NVlkK28wRnFMQ3JWUzh2NXBMeHFxY2NvU0dvOEFqbklXTkVhZlFUZEVs?=
 =?utf-8?B?QVJXRGJEVWRvYWtiZFRzNkJpNUlRc2k3YnRpbEk4aktzc0hXbGRCQ0VIWXVV?=
 =?utf-8?B?RnVrY25TMkIwQUFRR2MraEJXRWt0N00rM3EySHdwSCtOZngzYm9WRzlrZ0Zp?=
 =?utf-8?B?cTVQTEpxcThkbi9zYTJMNFZFSnZKaXhydWVVbmFsT2NObU9VNy80ZXhVVmhu?=
 =?utf-8?B?ZW05czBFU1FaVnJoNDBXZDM5RU9wZE9GQzlzc1FtZklvUjdJQW1Gd1NPTktj?=
 =?utf-8?B?dkloejVXMGljSWxGRUFXVHZtNE5vdzREM3FlUzNYYnFvVGlsNW5NRkNNZGh0?=
 =?utf-8?B?d00wL2xJRDJvQk9vMUJJTXJOcSs3em9lTTdiSlRmLytVNWNTQUVUMXF0WEcx?=
 =?utf-8?B?bXlRUVIxNWVwSWRlZ0M5d2g1bHNWVEdvVGFvdlloR0tKS2grQmM3N3NlTURm?=
 =?utf-8?B?M1ppc096S3l4TjVvUCs2WmhEYW16c0EybG9BcWpXaTVoeUFDaTRYOENLUjZx?=
 =?utf-8?B?cXlFb0t3TmtVUko0dG8rN1k5NjBITkEvNy82eTlmbVd0cVNJZlhONFlYb2lI?=
 =?utf-8?B?NzhtRjhJbC8rODYwdEpaL2RoY1dySS96cFRpTFdzSElaWmpqYXJnN09RMjU4?=
 =?utf-8?B?WElkb1o0V0oycW40anpVcEEvbFlDZ0lBY09vY0pLMnZyZklnaU1IaytzQlFW?=
 =?utf-8?B?RXZlNnNHcE1lSDdFOC9GRW95VkFPUHY0OStwMFdyMW5Lcy9lQWZxSENwMVRi?=
 =?utf-8?B?ZjJ0V1MzWjYycUxURkZZZVZkRGpHSVJHd0dOUXZlK21PT01JbFZJbm5iUHht?=
 =?utf-8?B?c2JuTHFSNHNrVVVMTzV5TUFmcU1DTVBlQkpxdEdxOXZ0TUU2SFd1SW1kalBG?=
 =?utf-8?B?ZnNsZHZ1NkxUU2NJcEhVMUt0VTZsQUJxZk1kS2RpYTFCdFZnNnlHQWtkRHNC?=
 =?utf-8?B?TWlpL0I4TVVnOXRvSnMrRGNSZDdpK3V0S01YOGZBMkd2amVJMFI1aTA4SHN3?=
 =?utf-8?B?dmY1TDRjNEN0OFdIOHRFU01tc3dheEpObTN3eGlUeUhiR2xUdGhXRmpUMmhn?=
 =?utf-8?B?SC9BeDljNGNOWnkvZUxHcHJkNlBMSnM3SlFnaUc2YVhQWmd1L1UvU2dwVFdB?=
 =?utf-8?B?dWhOU0Q2NE44amZlVlhpVnI2ZERzQWJzQ1lId0xXb2V0YUNBSE1wNTJ4ZGM0?=
 =?utf-8?B?NUFjUkFjaytYVHl1djNja2JXWm1DZ0pVTnhTY2ZOaXVKckg2TVBxK0RlMGI1?=
 =?utf-8?B?T1d6RU9zejFNWjFzMWVkaFRGNHUvMUVjNW9hMXoxWGxVNjBHbWR3MVo0bjgy?=
 =?utf-8?B?a0NpZTNKRWR0RGdXT1dsR3BocjlneE44ajlPcGJyWHFOZGR2V0RzOFBFbW4z?=
 =?utf-8?B?ZENwcFhycGV3cEJsZjNhMzVPRjlkUXFjOXNrVVFZMk5rckkvVE8yU0NETkZk?=
 =?utf-8?B?WjlOQVU1a01tWjZLVHBieW9LYzZTS29MMkRJQW00eEQ3SHhKWUZxYS9VRDc4?=
 =?utf-8?B?QkkxWWFkMGxCTXNERjZZOHJEcTVCVkdiMG1GZVVNUEQzOXpXd01ycHk4SnNW?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VkNTLSwca/1TZtnnBbvQeIpGlNuLlPB1mRH6V9iooiaQgntGOSBFanu/gMgVKOQ6zSwDaRokCD0jnzz/r5TwCgTSAeR5XnifT1Hy1pgTYnUDUaHsJw1Xbv+B1ZYqvzLjwAG9g7cAEcUTd+EwD1A32RdvBoVX1a8HK1CyYdvnDwtW8O+Aq2b5jfCztvT6UIbCl1ewJUeOBD6hXCL06kNOm1vEB6UxdUu1RpI9gg5pI2PrAxxowxt4Kwo0wlKi/axlIMeu7Lnc2OLAOJ2wxAkziFa593pQ4tjaM57HEQo/EQ1bSu6BcWxMdqPL6QJASCpxyMOzLUIfvxa06pzfjgMgzn7LpQoq0wq0uEfAnnHo9iNOa+SYyBIjf2I6JuXOV9gQOw51rR61YkYyTijsOsJz5Ip4ZIY6xVXCVyXx2E7JwruiUKLzKIT+3jMHN9S/Zun3X8F8Q4meo3+Rihdgrbo2OseAhlyfRsrwTJX2Eqx2oYwDygbWER1pEji9JJW/camgaiE5r/Q5G+MsIwY0ub3Zg3pxm9wU1J9zk744nYTIN23i576GQyNQFdNUVCRufi3HU+cgJioB4KT11g59OPIF8pv+IBvkthgU1+vkkkIDb1I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb56465-c23e-41cd-2433-08de12d6cf19
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 08:24:54.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OmuMbMLUHI3mmgloB/fxCc3lFq1yvn0zG/nSogl+etwYELzD/RnLBto+Fdj+vlk2zeWQctvF4s7D7vrYYUEpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE7CE61147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510240073
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX4L5Hw43fW7eu
 KQQZPQe02wL51rzQ8hCA3IvVjeygoBLvoE2mfNynYOyKb2R8H1NOELTZyu5jKeCQZWROPTC1WRJ
 8LLRLnrRUE9HzY5zuoKVHff1NmN5M6my1iWN2wqaR1pAi42nad9GI4BVaklgpJ46F6X5/hS61bV
 pVaIqCEtGbHx8h97yGRtmrEBGeZpE1zKOQD5yZJPROW1Hi1k3UOOT860dPZGk8g8kkX2syFAmUE
 CKbTHxwjfgqWyBbS8JQI7K2Cz58c1mo/a7kRmeRPfmjsBC4N8IYmQukTJRvjjA0JCGCn4XWnIrH
 2WukGCAA88LCKV2kXS9Aq0ENF+R+9eD8c+2gDHVtsynRtftoygWVNu+zEv1BSrZ4qyve7eGYUhg
 +vTJ/JSKDM0mDEbzY2V47lndc9/UXpEordZYlSlre4/IrqZOMfQ=
X-Proofpoint-GUID: 5SFYOKuqvp_ovJ3K3ExFSH0UCy_drlVG
X-Proofpoint-ORIG-GUID: 5SFYOKuqvp_ovJ3K3ExFSH0UCy_drlVG
X-Authority-Analysis: v=2.4 cv=RfOdyltv c=1 sm=1 tr=0 ts=68fb37dd b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=fBBdS__YzeyXMQ_NtjsA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12091

On 26/09/2025 20:05, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

Future work we should think about; add a few examples to each provider
doc. But getting the core documentation is a massive step!

> ---
>  doc/userguide/index.md                        |   7 +
>  doc/userguide/reference/dtrace_providers.md   |   2 +
>  .../reference/dtrace_providers_tcp.md         | 128 ++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 doc/userguide/reference/dtrace_providers_tcp.md
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index 18b9bcd68..d47df094b 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -259,6 +259,13 @@
>          -   [syscall Probes](reference/dtrace_providers_syscall.md#syscall-probes)
>          -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#syscall-probe-arguments)
>          -   [syscall Stability](reference/dtrace_providers_syscall.md#syscall-stability)
> +    -   [TCP Provider](reference/dtrace_providers_tcp.md)
> +        -   [tcp Probes](reference/dtrace_providers_tcp.md#tcp-probes)
> +        -   [tcp Probe Arguments](reference/dtrace_providers_tcp.md#tcp-probe-arguments)
> +            -   [tcpinfo\_t](reference/dtrace_providers_tcp.md#tcpinfo_t)
> +            -   [tcpsinfo\_t](reference/dtrace_providers_tcp.md#tcpsinfo_t)
> +            -   [tcplsinfo\_t](reference/dtrace_providers_tcp.md#tcplsinfo_t)
> +        -   [tcp Stability](reference/dtrace_providers_tcp.md#tcp-stability)
>      -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
>          -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#defining-usdt-providers-and-probes)
>          -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#adding-usdt-probes-to-application-code)
> diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> index 54a018d5c..029f62c54 100644
> --- a/doc/userguide/reference/dtrace_providers.md
> +++ b/doc/userguide/reference/dtrace_providers.md
> @@ -29,5 +29,7 @@ The `sched` provider makes available probes related to CPU scheduling.
>  The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
>  -   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
>  The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
> +-   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
> +The `tcp` provider makes available probe at different phases of TCP processing.
>  -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
>  Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
> diff --git a/doc/userguide/reference/dtrace_providers_tcp.md b/doc/userguide/reference/dtrace_providers_tcp.md
> new file mode 100644
> index 000000000..9f6e4928c
> --- /dev/null
> +++ b/doc/userguide/reference/dtrace_providers_tcp.md
> @@ -0,0 +1,128 @@
> +
> +# TCP Provider
> +
> +The `tcp` provider makes available probes that mark different
> +phases of tcp processing.
> +
> +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> +
> +## tcp Probes
> +
> +`tcp` provides a probe for each of TCP accept (established or refused), connect
> +(request, established, refused), send, receive, and state-change:
> +
> +- `accept-established`
> +- `accept-refused`
> +- `connect-request`
> +- `connect-established`
> +- `connect-refused`
> +- `send`
> +- `receive`
> +- `state-change`
> +
> +The module name is always `vmlinux` and the function name is empty.
> +
> +## tcp Probe Arguments
> +
> +The following table lists the argument types for `tcp` probes.
> +
> +| probe                 | `args[0]`     | `args[1]`    | `args[2]`    | `args[3]`      | `args[4]`     | `args[5]`       |
> +| :---                  | :---          | :---         | :---         | :---           | :---          | :---            |
> +| `accept-established`  | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `accept-refused`      | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `connect-request`     | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `connect-established` | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `connect-refused`     | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `send`                | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `receive`             | `pktinfo_t *` | `csinfo_t *` | `ipinfo_t *` | `tcpsinfo_t *` | `tcpinfo_t *` | `void`          |
> +| `state-change`        | `void`        | `csinfo_t *` | `void`       | `tcpsinfo_t *` | `void`        | `tcplsinfo_t *` |
> +
> +The `pktinfo_t`, `csinfo_t`, and `ipinfo_t` structures are described in [IP Provider](dtrace_providers_ip.md).
> +


this is the table format we should standardize across provider docs IMO;
having a standard format will help the LLMs likely.


> +### tcpinfo\_t
> +
> +The `tcpinfo_t` structure contains TCP header fields.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
> +The definition of `tcpinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct tcpinfo {
> +        uint16_t tcp_sport;      /* source port */
> +        uint16_t tcp_dport;      /* destination port */
> +        uint32_t tcp_seq;        /* sequence number */
> +        uint32_t tcp_ack;        /* acknowledgment number */
> +        uint8_t tcp_offset;      /* data offset, in bytes */
> +        uint8_t tcp_flags;       /* flags */
> +        uint16_t tcp_window;     /* window size */
> +        uint16_t tcp_checksum;   /* checksum */
> +        uint16_t tcp_urgent;     /* urgent data pointer */
> +        uintptr_t tcp_hdr;       /* raw TCP header */
> +} tcpinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `tcpinfo_t` from a `struct tcphdr *`.
> +
> +### tcpsinfo\_t
> +
> +The `tcpsinfo_t` structure contains stable TCP details from tcp_t.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
> +The definition of `tcpsinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct tcpsinfo {
> +        uintptr_t tcps_addr;
> +        int tcps_local;              /* is delivered locally, boolean */
> +        uint16_t tcps_lport;         /* local port */
> +        uint16_t tcps_rport;         /* remote port */
> +        string tcps_laddr;           /* local address, as a string */
> +        string tcps_raddr;           /* remote address, as a string */
> +        int tcps_state;              /* TCP state */
> +        uint32_t tcps_iss;           /* Initial sequence # sent */
> +        uint32_t tcps_suna;          /* sequence # sent but unacked */
> +        uint32_t tcps_snxt;          /* next sequence # to send */
> +        uint32_t tcps_rnxt;          /* next sequence # expected */
> +        uint32_t tcps_swnd;          /* send window size */
> +        int32_t tcps_snd_ws;         /* send window scaling */
> +        uint32_t tcps_rwnd;          /* receive window size */
> +        int32_t tcps_rcv_ws;         /* receive window scaling */
> +        uint32_t tcps_cwnd;          /* congestion window */
> +        uint32_t tcps_cwnd_ssthresh; /* threshold for congestion avoidance */
> +        uint32_t tcps_sack_snxt;     /* next SACK seq # for retransmission */
> +        uint32_t tcps_rto;           /* round-trip timeout, msec */
> +        uint32_t tcps_mss;           /* max segment size */
> +        int tcps_retransmit;         /* retransmit send event, boolean */
> +        uint32_t tcps_rtt;           /* smoothed avg round-trip time, msec */
> +        uint32_t tcps_rtt_sd;        /* standard deviation of RTT */
> +        uint32_t tcps_irs;           /* Initial recv sequence # */
> +} tcpsinfo_t;
> +```
> +
> +**Note:**
> +
> +DTrace translates the members of `tcpsinfo_t` from a `struct tcp_sock *`.
> +
> +### tcplsinfo\_t> +
> +The `tcplsinfo_t` structure has the old tcp state for state changes.
> +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/tcp.d`.
> +The definition of `tcplsinfo_t` is as follows:
> +
> +```nocopybutton
> +typedef struct tcplsinfo {
> +        int tcps_state;        /* previous TCP state */
> +} tcplsinfo_t;
> +```
> +
> +## tcp Stability
> +
> +The `tcp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
> +
> +| Element   | Name Stability | Data Stability | Dependency Class |
> +| :---      | :---           | :---           | :---             |
> +| Provider  | Evolving       | Evolving       | ISA              |
> +| Module    | Private        | Private        | Unknown          |
> +| Function  | Private        | Private        | Unknown          |
> +| Name      | Evolving       | Evolving       | ISA              |
> +| Arguments | Evolving       | Evolving       | ISA              |

