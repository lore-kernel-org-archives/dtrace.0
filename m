Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD23BE4E
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731616728; cv=fail; b=OEVOXUAhPFzAbSfT+/f3TT/WRNg3NmLIdw+H9CtiD8ZYBCkAv++DkUUwA+vbsSiMqQ3k/EkPxoZ83rs+nubKLsrOc6zMobffRTlzymD9jyXtXuf128ZhayIA740jKwOeEsb+5GLyd9duA71AT3KDy6qUlcI4bZXglAQh0HB6hbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731616728; c=relaxed/simple;
	bh=ou5xGkh9IrsuYAQ/gUY5dntGm93tKHofMPKXRJV0e8c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=CXGggCyZ8T2OT42f+zsLQ12uXyE5v5/7+F7v18aQHLzJmg10v5PA3UdUVreIgvLJ6ALLoUXIARKvqO508DV6JihzJIPOjW52rpS02T4zjGk7lB63O/kcXl7w7ByR89rb5si8D34qYF3v0Ox8kvlCz0VDWtIRUaj7uCagqps6J60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KT1x0j+y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nXzYRsHr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KT1x0j+y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nXzYRsHr"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEJfgNC008084
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 20:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=HmGPUhw5SDZZQlHOaqjqFGv5uAtAvpMipkdNnRlF3ac=; b=
	KT1x0j+ysIC5mrH/bYzbrBlJ0//urL18si7VvTvTQiTG4QKOIaVZtt9brH+w8ZXQ
	Qf/OScC1Swm2eHIWyfhyL+Hnow8Zy3xcqDVGXqCuOK9tSXHdcytBDPP4uqSOm7Wr
	dKDFom57ZvIESD1qxCoreCSRvR3yeUkmVx5nzShpEucJ1v+z4MvyFEu3EjcHv+h4
	qsMEGNvUwvvGIHkzOI9+xCNFuY3isCVrp1JT5XXI1ciT59L+AAhnilIJBSB1S0cU
	KJSD5yZW7Fquwm32T0eoV/IKpE1Ypfqy7gtf5WLr7wr8vyh/Die8BBmXsgJNr2SA
	15QrHF70+EtTJkzIn1oxXw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kc28f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 20:38:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEKEiWX036059
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 20:38:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bb91n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 20:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLFYcAWWW415EgUCWB+mC6tjHCCCmMV0BFkrLqvy0IHbrWBgmoZw0rFk6vwtFFJkYfPMOMgWTqkB/sSeHH/1rKhHcScL/+duiG2HDvhQ2hiIX8FRf0qr8rWYt6E6ReCgPhyJxtE/RGH0bUN7HAVCW1WSz5ZZb9ulehUAwk/osj3hoFtMWmUqNQRUmiet1fAjIywuEkARG4BjkaB/dIBoKFkyxsGnQjo2BbgJs79PMGseMeS+syshtFFsv7NlFlXT3EZ6UkFLBzQCyHCkTq0PtQcIy7CYttMsoq1oaJkxapoA8lurRVsgFoand1SZfop1uawc5pBzKHNj1kl4rdSB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmGPUhw5SDZZQlHOaqjqFGv5uAtAvpMipkdNnRlF3ac=;
 b=wDhfW5nN7ffPp2Y3XFLdRCd+4GgZooe8bDKzNmei9mzbQcjrwqLUXwm5swEjxCDPwt0xmWBQ41kk8PN9C+aei+iTbMZzU0czQfAE//Ab/AbZ1FFsU0Li3VpELvVyZHo1Ox+9zcQJoLUH31eN+SRraKy/6Y0QpuyvDof/y9FY2LVoPXLZ/AczB6UrdSzIj5dZ0KXhQ2Wccph9D8JAlprFrnlDtI6rbg4aC22xcedcqKSlX7tdjEDCEbZQh6bUTPBYGjFOc00OGDkuoAm4V25BbcbVd3vufSBabtczAvOL5zRX0lV0AsyFvf239Gzwb8tqJMw2R+EXNv59z3USzYkO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmGPUhw5SDZZQlHOaqjqFGv5uAtAvpMipkdNnRlF3ac=;
 b=nXzYRsHrmA9p/FMkLGNhkbIFxSGLyyhftj1f9aN+oMf/jsnF1V17sMb4TQ/4BvKU7CpjeZAo6LHvXlhNpcZITdwniXTrnWLme6Db6+PK37eSS0Bt8qnV1Tl23maKJHqVD3dZU9nFT6lb62YWHYbX9hjrQwO6v5pWdqbZIhhEu+w=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH0PR10MB4566.namprd10.prod.outlook.com (2603:10b6:510:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 14 Nov
 2024 20:38:41 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 20:38:38 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] dtprobed: handle multiple providers in a single piece
 of DOF
References: <20241114160352.47939-1-nick.alcock@oracle.com>
	<07a4d685-cc8f-d6f6-0d1d-e5933bddeafe@oracle.com>
Emacs: because one operating system isn't enough.
Date: Thu, 14 Nov 2024 20:38:33 +0000
In-Reply-To: <07a4d685-cc8f-d6f6-0d1d-e5933bddeafe@oracle.com> (Eugene Loh's
	message of "Thu, 14 Nov 2024 14:53:39 -0500")
Message-ID: <87frntwnxy.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::29) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH0PR10MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: d817baeb-fceb-4573-bb60-08dd04ec519e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUtIeDJFcm04NXBQTWtsSUQxWVZjQmR3RXpkN3AyMnc0WVBmZGN5a05Odk9B?=
 =?utf-8?B?TjVuaHhheTBDRVE3bEI1ZGF3NnE3cWZ1Q2tCOUNDMmEveHB1QVRlK2pYKzlF?=
 =?utf-8?B?NmZYZVBRSndrUzAreldabGdrTnNheGRFMVdoWUlEamNpNVJ6NXV4RUo0VkRl?=
 =?utf-8?B?VUovZVY3djRQZ1QyWFNzNWZCWlZyY2l1R2puR1B0Uyt1emdRM0taRy9xdGxV?=
 =?utf-8?B?OGZFaXNVSmxmK2Z2TnJ6cnl6Wnp0YktHSlR4WmU1SGlEN2hkbW1kVUNjNVJS?=
 =?utf-8?B?clFWOHk3cXJBWlptTFo5d0xNV0lKVDhSVDJNMldGcGNVanRFbDQwSG1hNGNv?=
 =?utf-8?B?MDRSS1V2TlYxNmViaVI5V1BzODhvOFN6S0VUdXpXNkw4aW1vcHdvZWxpYlhu?=
 =?utf-8?B?cldjWjdVNEl3UThUSUR6MG1RQWxXeVB4OTRDOU5hbk1sSDJkRnJWaVlwang1?=
 =?utf-8?B?TGMyckpZbUF6MFZVU1BvK1d5VVlKYWE2Q0tnR2hxN2ltdndMTzZvNGtjS241?=
 =?utf-8?B?RzYvWlRYUisvczRGaElBeE1DZjlrZGRSSWNGV2Zmc05kWGRrVXREQUxhcjk1?=
 =?utf-8?B?TUczeTEzZHZKUWdNeDFNV2xqZmtNMUYrM2x6d3AzT0hsRndvZmlsZXhwSTJG?=
 =?utf-8?B?c3YzTUZwaWozQmN0WEpuNHlrMUkrZjBhMVFjejVtZXltaTZKUGlBTTJaU29s?=
 =?utf-8?B?R1VsMDZ1ckRUby8rb0NTa2tpaXZOMEo0dWpPaVdFRDQ4OUpxWFJicDNOU2J0?=
 =?utf-8?B?aEIxbGdQWUdDVHdTeFZvbzl1RElBdklYQUo4N2c4b2x4b2ZlcWNGck5OMTBw?=
 =?utf-8?B?R28xbGFaa0lTWldKVnVBQ0Nta1ZPV2JNNFpqbXJSSE4rM1FpRFJydlJwTDZX?=
 =?utf-8?B?YUtYMVZ4MldHMnVjTXJ3QW5PVUxocldFbG9qQzFtVlplZXpOVHFtUHhma2U1?=
 =?utf-8?B?NCt0bWFkQUQrREIrVS9KVlUwLzhEd2FmVVVjNVBGYjRURlh3NnY5TXErWlB6?=
 =?utf-8?B?ZUNiOUN2RTJSUzhPeVhYZEtRUGRqWjRTalJodUdudlBGdlpGTFpwbVJlOVNp?=
 =?utf-8?B?dFMvQUpNTUIzZ25tTjZaLytuZEdxb0dXRW5ZVWdCR3c0bHVhQWEwMW1rRnZl?=
 =?utf-8?B?UFlJazNsM2ZmSVlubHZEeitzMDFPeDRzNDlUSWUrVUhpUXBPRDJMeUFSUEFz?=
 =?utf-8?B?cUFDdXlmUnBKS0ZmRUhGY3BFdWRpT2RGQThJUllZT212eWdBUk55eEt1ajl4?=
 =?utf-8?B?OXYwYUJpSzZvMFFtNDlwK2JSR3RWdlpSZDc1ckJOKzBiWDJ3bjZaendMY1dQ?=
 =?utf-8?B?dnRZRFBrU1kzSTdEeWp2dkhKaWY1QmJhaHlUUSs4VWYwbjhGbUpzUEpLMnFN?=
 =?utf-8?B?MUxBSk9ETlgrakc1UVFsZFhndVM3YlIyZEROelhEZjRxNWVCRURCZDV6Sndm?=
 =?utf-8?B?MjY0TFNITWk5U3lWUFpNUENpMVM2c3RQd3RWczZuZ3Q2STZrWUVIa3pNNkVI?=
 =?utf-8?B?a1hEY2M2Z1hydWhiUWE4VDhmelR6Vm1ya1VtK3VkOVY0UVhra01ydGxpTlJG?=
 =?utf-8?B?NmRWT242TjZKcGpFc29uejFrd05GS05Sb1FLcUp0K0IxVFJ6VnE5ek1TVGhL?=
 =?utf-8?B?UHFIQ2ZhckluQjk4bWhWZVl5UnR3VW1ZZThiMVYyTlArR3RIYWJlWlZhRXdW?=
 =?utf-8?B?THYxYUcrZmRiWU9wSUV4RXVLRGJuMzRmY1VWcUZ1ZUVIMkNVWjhac3Y3Mm5H?=
 =?utf-8?Q?r15bVBsof7Z2KFv2Jl3Ot5WGLbFwKmCrk5IGI1I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVI4a0hhSVRFT28vdmRaTStvTGhjdWIyWmtpL09HRVYxQW93UkZGaXZDcXpE?=
 =?utf-8?B?a29ESHNoc0IzZWZUZU9lNFZWMXAwNFhxajdoekJ2eU90bWJod1Q3R2VyZENs?=
 =?utf-8?B?VUhhNVpuUGdNbGlNaUJWV1pMTzMrZGtIUUJucWdzK3VRZzcyeWNPRHJjTTh0?=
 =?utf-8?B?RklIMVNvOXpTbEdDd29yb09CaTR3UU9qcFdKUVRZaDRYRkVoenY0dCtSdktn?=
 =?utf-8?B?eTh2SHBRYVhoVlQ4TXFzei9vZU1lSGVMWUQ3ZVJ2QnZHb21OMGZpRzdqYVZt?=
 =?utf-8?B?ZlZ5c0QzQTRHQStWY1RWYlZxcWQ4WVY2bWFyakpZdDExOW1jQWhqWnp1YTZD?=
 =?utf-8?B?M3lOTDM2SEVwb0FqdkxuU0g5QkRjVFR4em11eHNKS1F5ZG9FZnNQa2Ewclcz?=
 =?utf-8?B?aThCUHV2VGJ5M3V3OFJPMFcrVGZLS2hDb21zL1pUQmFyN1pnZFlzdFlSdS9y?=
 =?utf-8?B?OXRQNG9PVXZCNlJjNEMxQTNDeFVXSXU1MkVyV0ZuSTN4TVdSRFJnUS9aa0ZG?=
 =?utf-8?B?ZEtEbDl4OW9SVDBseHJ6bllSaUk3b0pLRnVVZW9JL01CQTZicm1jZ1pXN3pT?=
 =?utf-8?B?TVppb1cxeDNNcFpxNERMcVk4cnRJcVcrSUQxZXNkS1l4dkd1MFpMbWVBV1VC?=
 =?utf-8?B?Zk1GSEl4U2ZSd0F6SnQ0RE15WXBUY3R3NVFvVEpBdTh0MGJ6MjdySVdXUXJS?=
 =?utf-8?B?ZmRaRldvejNaMUY3K3R6OUNKTWRQQ0tuWUtKelpWT2EraWJPc0xwWDVYMjZw?=
 =?utf-8?B?U1A5STN3eUQwVjZIeVBoQXVlT0VHR0xVeVlaL0pEcERWaUJVdzdKVHBoeGxD?=
 =?utf-8?B?YUt0RVVRbms2WDY4clAvWFNjeE1ETkhWRFA0YUtnLzMyMG16M09PbmtZRWND?=
 =?utf-8?B?RkdMTFhMYTY2OXc2Z3NWaG9FS2ZCZjJYbTBZMUFnbGRYYy83RUFDa2lJTkFB?=
 =?utf-8?B?NHBWY0FJWWE5QVJNelQrblVRbmlIMWJuZzdFbXJvelROd2dQMWg4L0VmeUta?=
 =?utf-8?B?WUNUZTVhOFlmQ0xrRnlxbGZOd1FZaVY4Z3pYWGtYaE55V0xVWnllaXBQMUxF?=
 =?utf-8?B?TXUza3dTelpaUDdwU2VaSUdBMVhGOGt4ajJCbkNoSGdENWFCbU9mb2xNSTA4?=
 =?utf-8?B?cTBQLzVMSkRXV2ZsY08xbEFraTBYRlNHcTNHZ1p2QndORXIyaFRwTU5ab1p4?=
 =?utf-8?B?MlZsdlVOZGc1M3RGRTl6SmZWZ3RGTUJJY0hVa3RHK0JSemtKTEdPTUNmTVhD?=
 =?utf-8?B?ZG05SWY2bkpwblJ3Rk1ZRTNFUStCZDU0cFY5WU11NUNMcWVZeEdVZ0pjNStq?=
 =?utf-8?B?MkNUclFqV3I2SGNsYnlhaW5sbk9nWitwcDhWakUxWDlRSDJaTk1IMm1NR2Jr?=
 =?utf-8?B?LzNjWnNGTjVGYTlia1psR3A0SWRHMnFiWlQ0djZwSXpOcS9MankzUG9FZEhK?=
 =?utf-8?B?VnhyTC9ZZmE2VUc2S2greFVad1RaUCtHRDNuR053dzZpZHRuSnJtbWNNWnh4?=
 =?utf-8?B?ODF3QVRROVFEQld6TUNSUlk3Mm1ZZTJEZGpZbnZSY1FWVWwydXZpT20zclZL?=
 =?utf-8?B?c09HTEZsL0hmSGhIMUNTSlNqWW1Ibk4ycG44M2NOQ3RTdFU4NzhZYlpRMnNZ?=
 =?utf-8?B?Z0xNVElCTHV6U3ZYazZnU3NqUzU3R1MydEJlNkI0WmtBaHMxUlZJL1FyT0Vn?=
 =?utf-8?B?VjRJU250Z2JMN29LSFBJS3lJdmRySFhJUkU4L29Sb0JQVWtRR1dQcFFIaFdm?=
 =?utf-8?B?bkcrWnFYV0l1bnp3VWVNVFo1MXdFZUtidC9jeHloMUJBRHVwd2NMdld3WDJ0?=
 =?utf-8?B?VXMvRDVMVzREam1LbFZzL0lobHU1cFpCOHNVSHZraHFzRFR1UW1IMW5JMkxR?=
 =?utf-8?B?VktSaTFWNnAyeVdjSjluN1pQZDBjaWk1dENpbHA3TTFUblByZEIxZDNQWlRJ?=
 =?utf-8?B?Y3FBYm5tNmpPKzR0VWgrcUlJS3B3VDhlZTFsK0d1QVZPc1hta09CTUdmZUkw?=
 =?utf-8?B?VG9XS09aQmF3d0VrVDlBek9sWENSdHlZZXhRU3hRTlNRZUsyNjdHS0FJdytz?=
 =?utf-8?B?UDVmTjdWeDdUYlJXMFNQaEw4dzA2NzZqRkI4aEZ0WmplTXRiTHBpWUN6ZEZM?=
 =?utf-8?B?L3BaL0s5c0tpQWNHeWJKNUwyUk9xVUNkNTJzTytJUUFYVFRoNHZWckpkUlIr?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GzWY5FGSYrmY5XaWO6kFohJkoTntctAyPLe6GZr7VbINpK3vrmMJHoPL6lj5KJvlq88Vbqryg5XLzHYBa1drOmhs9ouJW+Oyu/fkjBbdGHVuUMI+LXKlSahaycTcCSXXR7zK22SNPQzAoGiqhsim9wCRe2WRt0yesm/r0axE/Fw1SsSg8prFyRFqsLQIE1caXVJlfxQ9QraLUn/WNPXZHkuLvo9RULno8VT4SiXukcw7tWG16Lgk22UNhoHfwBzuO8nYFwCrKLdlbhPYreqfdvqa69W78dtBDYRnIetxN+MZGeId7JBoDBXtg98fonCfg96g3G2W3oCk33zNm21niFkZ3hliz0PcQHj1RZFHFOxqmoLozRWsTFUT68uz+N4ZuoltcJgGc26zQ00VPWvLLDNzfPNCFzowPbQqxHnSbBuA1V8M+647+hehNkFTtLpLcC2qyB93n9AshDI1BoId46WMjsmA2Y6hMfs96rBZ4xlmJTNjKGR6Il0kWMlgYhYd9DryEen8Zy0f520npOrHzafDzcRbyc5uxviddK2noWFBFZvx/EHqqFyqznZhS6dVmztnqpi3K5TJUo2Qx2lBZ+MS+sXAlY9+jjgOn/dLHWI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d817baeb-fceb-4573-bb60-08dd04ec519e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 20:38:38.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRIAGBEBL/W2kaW8musgYDA5Y7dTl3AELN+dP9lkb06sSMaW+JToN2Kx240/59kfCZDS3vV16sxpnJdSjYJvEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4566
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140162
X-Proofpoint-GUID: 49i9ga5zo27n5KtcZZJXEHvACQayMXEj
X-Proofpoint-ORIG-GUID: 49i9ga5zo27n5KtcZZJXEHvACQayMXEj

On 14 Nov 2024, Eugene Loh told this:

> I'm not familiar with this code, but here is some amateur feedback...

:)

> On 11/14/24 11:03, Nick Alcock wrote:
>> diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
>> @@ -24,6 +24,7 @@
>>    *     DIT_ARGS_XLAT (1, optional)
>>    *     DIT_ARGS_MAP (1, optional)
>>    *     DIT_TRACEPOINT (any number >=3D 1)
>> + * DIT_EOF (no more providers, last record)
>>    *
>>    * The dof_parsed.provider.flags word indicates the presence of the
>>    * various optional args records in the following stream (you can rely=
 on
>
> The new line has indentation inconsistent with the pre-existing lines.

Intentional. The full context might make this clearer:

 * DIT_PROVIDER (at least 1, which contains...)
 *   DIT_PROBE (at least 1, each of which has...)
 *     DIT_ARGS_NATIVE (1, optional)
 *     DIT_ARGS_XLAT (1, optional)
 *     DIT_ARGS_MAP (1, optional)
 *     DIT_TRACEPOINT (any number >=3D 1)
 * DIT_EOF (no more providers, last record)

i.e. this is showing that "this is at the level of the DIT_PROVIDER
(after all DIT_PROVIDERs) through indentation. It is *not* at the level
of the DIT_TRACEPOINT.

>> diff --git a/test/triggers/Build b/test/triggers/Build
>> @@ -13,7 +13,8 @@ EXTERNAL_64BIT_TRIGGERS =3D testprobe readwholedir mma=
p bogus-ioctl open delaydie
>>       ustack-tst-spin ustack-tst-mtspin \
>>       visible-constructor visible-constructor-static visible-constructor=
-static-unstripped
>>   -EXTERNAL_64BIT_SDT_TRIGGERS =3D usdt-tst-argmap usdt-tst-args usdt-ts=
t-forker usdt-tst-defer usdt-tst-special
>> +EXTERNAL_64BIT_SDT_TRIGGERS =3D usdt-tst-argmap usdt-tst-args usdt-tst-=
forker usdt-tst-defer \
>> +    usdt-tst-multiprovider usdt-tst-special
>>   EXTERNAL_64BIT_TRIGGERS +=3D $(EXTERNAL_64BIT_SDT_TRIGGERS)
>>     EXTERNAL_32BIT_TRIGGERS :=3D visible-constructor-32
>
> Okay.=C2=A0 Introducing a new test/triggers that is used by only one test=
 is... well, I guess it's a judgment call.

It makes the test way simpler :) and if we do add another test that
actually fires these probes, it won't be used by only one test.

>> diff --git a/test/triggers/usdt-tst-multiprovider-prov.d b/test/triggers=
/usdt-tst-multiprovider-prov.d
>> new file mode 100644
>> @@ -0,0 +1,12 @@
>> +/*
>> + * Oracle Linux DTrace.
>> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserve=
d.
>> + * Licensed under the Universal Permissive License v 1.0 as shown at
>> + * http://oss.oracle.com/licenses/upl.
>> + */
>> +
>> +/* @@skip: provider declaration - not a test */
>
> I don't think the @@skip is needed for something inside test/triggers.

I copied it from other things in test/triggers just in case. You're
probably right. I'll submit another patch dropping it from everything in
test/triggers.

(I think it originally appeared in usdt-tst-forker-prov.d, and
replicated from there.)

>> +
>> +provider prova { probe entrya(); };
>> +provider provb { probe entryb(); };
>> +provider provc { probe entryc(); };
>
> We should stress test more:
> *) =C2=A0 multiple probes per provider

See v2 of this series! this had... er... fallout.

> *) =C2=A0 some probes with same and different names as in other providers
> *) =C2=A0 probe args (including probes in different providers handling ar=
gs differently)

I don't really see how this could possibly go wrong -- nothing after the
mid-parser stage can possibly have cross-provider interference as far as
I can see, and that stage doesn't know or care about any of this stuff.

But ICBW...

>> diff --git a/test/triggers/usdt-tst-multiprovider.c b/test/triggers/usdt=
-tst-multiprovider.c
>> new file mode 100644
>> index 0000000000000..430c0cdd2cf4d
>> --- /dev/null
>> +++ b/test/triggers/usdt-tst-multiprovider.c
>> @@ -0,0 +1,22 @@
>> +/*
>> + * Oracle Linux DTrace.
>> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserve=
d.
>> + * Licensed under the Universal Permissive License v 1.0 as shown at
>> + * http://oss.oracle.com/licenses/upl.
>> + */
>> +
>> +/*
>> + * A trigger with multiple providers in it.
>> + */
>> +#include <stdio.h>
>
> stdio.h not needed

Agreed.

>> +#include <unistd.h>
>
> only needed for usleep()

... ack.

>> +#include "usdt-tst-multiprovider-prov.h"
>> +
>> +int main(int argc, char **argv)
>> +{
>> +	PROVA_ENTRYA();
>> +	PROVB_ENTRYB();
>> +	PROVC_ENTRYC();
>> +	usleep(5 * 1000 * 1000);
>
> usleep not needed and just taking up test time.=C2=A0 It was originally i=
n some tests that were checking /run/dtrace "manually".

Ahhh. Dropped.

>> +	return 0;
>> +}
>> diff --git a/test/unittest/usdt/tst.multiprovider.r b/test/unittest/usdt=
/tst.multiprovider.r
>> new file mode 100644
>> index 0000000000000..b83f559a7e7ff
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.multiprovider.r
>> @@ -0,0 +1,3 @@
>> +ID provaPID usdt-tst-multiprovider main entrya
>> +ID provbPID usdt-tst-multiprovider main entryb
>> +ID provcPID usdt-tst-multiprovider main entryc
>> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/us=
dt/tst.multiprovider.r.p
>> new file mode 100755
>> index 0000000000000..ae8493e3d5be4
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.multiprovider.r.p
>> @@ -0,0 +1,2 @@
>> +#!/bin/sh
>> +grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s, =
 *, ,g'
>
> Okay, though the "grep -v" would be clearer to me if it checked=C2=A0 '^ =
*ID *PROVIDER *MODULE *FUNCTION *NAME$'.

Why? We're not dependent on the format of the header, we just want to
get rid of it. Having the test fail because the header we don't care
about changed layout seems wrong.

I might just drop the first line with tail -n +1...

> This whole thing would be clearer to me as a single awk, but maybe that's=
 just me.

How? Piles of gmatches?

> Comments might be nice.=C2=A0 I'm not sure how comfortably people read re=
gex...=C2=A0 I need to concentrate hard to figure it out.

Honestly this is just doing some "replace changing numbers" stuff like a
hundred other .p's in the testsuite. Looking at the .r makes it obvious
what it's up to.

>> diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usd=
t/tst.multiprovider.sh
>> new file mode 100755
>> index 0000000000000..d5b72c2be77ec
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.multiprovider.sh
>> @@ -0,0 +1,15 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved=
.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +if [ $# !=3D 1 ]; then
>> +	echo expected one argument: '<'dtrace-path'>'
>> +	exit 2
>> +fi
>> +
>> +dtrace=3D$1
>> +
>> +exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-mu=
ltiprovider
>
> Okay, but there should also be a test that actually fires probes.

... why? What we care about is that DTrace can see the probes properly
(since we already know from other tests that once it can do that,
everything else works), and -l is an easy way to verify that (and in
general exercise the entire pathway up to USDT probe discovery in dtrace
itself) without having to get tangled up in even *more* possible bugs
around probe firing. I hit enough bugs in the parser writing this as it
was...

I mean I can write one but I don't see what it's going to tell us.

--=20
NULL && (void)
