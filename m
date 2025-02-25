Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D45188734
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740508124; cv=fail; b=fI6dCzmApqlVJow4h/W5741yuFcefnZ0M5onEe92hclu3krSuOma+MV+8xMwmtnkNJJXFGdXtsb5z4FbWsVMhR7aLkXlgN2DZv/YkwGa7iE+IVOmCm+tLUOKJ0Z42bj4AoxB5lK1l/Z1p2X7pdpxMp0YpmS8H8K9oWF2ru+ArIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740508124; c=relaxed/simple;
	bh=M2+qjlXLZM0dnLElc4mF4o1ngnAG5bb8pnLr2LviB+w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OLJ0saVTYMa9SRFdxiWlc140iMWUgEHmlQxtokGR715nkJc6QpwqNj5EqST3o0glN0jZGtocWMpHxi02uJ6ApBAECC8YWZ5zlV0DsIrtztN4MMrdbj4yaFKsLvUA3RZ4F6HV6yaVxiTvgFKpR6LNvjAWVBYIOaF2/zw+n3uJcKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UO3RsaNI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GnETKywn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UO3RsaNI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GnETKywn"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIRX4H005152;
	Tue, 25 Feb 2025 18:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=joag9hxe9UIlX0kyVUbmcZw73BeMViXyT2psQ4lzC6c=; b=
	UO3RsaNIiANZP31m37ysEfOyfucE9Li0WzWLaL3dJHRQuUxTpyMWVv814fucfxIW
	6YCVkDt8h5g0UKhgpUNUiyCNmlmu6/HolQqVkCpxZ+VRmFx7e+HZFHO3Od715o9b
	pGhDEZ5/uMSA0g2CYdz8cbaCZSWCDscVlScgjIkqojCDB4c58BIefKW23cH0aE8S
	haiSdRnHvsrmbx1cNOkA2Vo+iY8Xjee52OCVSHyWFcgEOqytHtGwJ1jBG3jkKICE
	4z6pWV7pK3w8wyM4qZYzDik+60GxlRti7BKD2oWPU5LQdWMNF3tcEmL2doO1Hn2Y
	Irg4Rs2e3OMseG2R71swcg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y66sdyc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 18:28:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PHbqvS010259;
	Tue, 25 Feb 2025 18:28:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y519c75h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 18:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1kubloXIOqCMCYX+ttou4ZvEa38aX8MnEYKLbuF85beXBVBt+EMJBjn6NnLgq28AMyxeZMd75yyIG4TpqujhNRtUwM0+IsWqB9yd0RwDrOGPvV4IpamZGKHxT11qGTAFiIRpRbt20wjTRjPRF6EwXDrYcsMAh+bAlQVUxuThdIkr9022yWwR+v0AOKWelw9G9uCYZH7Sy3pikPkgrFW+l/M8f2W2m5ZWsbIo2nqQzh8r8rba49vC1AfmmYFJvhLEEWWM6p2fC2KTxkh6XtdfIypPYpPqrVlR6YG3P35X8SnNsWaOC6VwSGUf8B6Kx8tnvDCMwJFL/eaGqB1cgCMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joag9hxe9UIlX0kyVUbmcZw73BeMViXyT2psQ4lzC6c=;
 b=LMC+4Hes12fKlMrHozLgjGbOJnL6VHn0nXebyEdpbADzFU72C+sF/9NoLJ7d6y7LEuo9GSi+vhn7aoZxdWzziM5ckeFEd+7swEh63I3SL0+XZrDP0QKTwTftf+cc+m8FIUrDN7eYPfwCp9PdiQp5YusBXCTAgWyu0BiVkvzr63/mD1mGZIxb3OEzCDYQXhubRNGeRVMczciVm8DsWl9ISILPT0FfSfin4i7CeeswxC2X4/L7r7Sx/hRu1amj0G88SneVKdmVc0HLXtfrr1brHFtuVacBrvqpzyLjCzDu3Six6B2D5m/op2I4KWkCppL+UXTNok5Q9zYcza+ofz/MVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joag9hxe9UIlX0kyVUbmcZw73BeMViXyT2psQ4lzC6c=;
 b=GnETKywnDkuC0VROv0zrhpKcZmet5UWRnjndVdjMHC8sP/j0sb4gHCBnS5nAdbBYqJTbslOyKTu1vDIRxRiXPyb7atoV+Uqs+Co7hXfqXRjADA1Z3EK304FPdbojF2GnlMFbZt7+SdsQVNWZXFHbwZiRAv33ydYNpyFN1LvoYjU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7480.namprd10.prod.outlook.com (2603:10b6:8:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 18:28:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 18:28:29 +0000
Message-ID: <744e0c64-c471-f483-0e1f-6e2b26562abc@oracle.com>
Date: Tue, 25 Feb 2025 13:28:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] test: fix 'harness' typo
Content-Language: en-US
To: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
References: <cover.1737686990.git.sam@gentoo.org>
 <2fc6a32931506257f24b24e0c35259189fb37108.1737686990.git.sam@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <2fc6a32931506257f24b24e0c35259189fb37108.1737686990.git.sam@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0154.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3d6792-7cb6-4997-f9e6-08dd55ca337b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTlEWXk4YU5jakNsNEkyM29QU1N1a2dBRHA0cGtxQndLS01tUkJxTmx1R3VK?=
 =?utf-8?B?elVWTUtEdDNTU05YcFFnRFVhN0dLT1FqV2hYS0FHNmlKR1VmMmhDVzhtcStU?=
 =?utf-8?B?TEJ3d0xlU3FNaWRqWDJnTWQyeVdPY0xjMTVrRFl2NFhSTTVJaFUwcHUremlX?=
 =?utf-8?B?b0ZnOEUrb1pQM1JOdHBkY3dvR2V6SnVvOEFIek9PRjVuTElVYUVxS3R0bitj?=
 =?utf-8?B?c0IvUUJWRndMSld3SXg0Y1FySUdiQXpQd1dvTU9qZktOSGhOeDVUVGtxQk1s?=
 =?utf-8?B?bE5HdDNEejlFeWJlUVI4NURrSWhHU2dDOUJvUEZuakpPaFRxL3NsT1luemFM?=
 =?utf-8?B?QVQ5cmlMdmRQZkpzUTY3YzhXd1A1Zyt5anJYTFZzTkt5cHI2dWNWSnZNNDI2?=
 =?utf-8?B?eFNtUmRQM0d2SjVNSG1GZDZ4VGJvVHpscnVuaHVLcDRpcnREMDhxSmNtd2w3?=
 =?utf-8?B?YWFhenk1WlZOd3hrYi9wNERRclhUZWtOTW45d1B5ZEszeTltaUtBY0xtUVB0?=
 =?utf-8?B?SzBhbFprUlEwelJwZGp4QjRsUGZ2V296UGF4ZUJaVmN6WWx6QUxkVDc2WGZt?=
 =?utf-8?B?UzhPYkE4UlAyd2twRTZXNDY4WUczOUhRVG9nOUVUZlNHUEF5c2VXRGZRL3Qx?=
 =?utf-8?B?SFdvNUdHWmxlamRrSXFQVHltZFZnemVhdFBWNnFjSzh2K3hzajlTMTVLMFhO?=
 =?utf-8?B?MXlZSituUjVPNWlCTzJaQWdpZWMwOEJnOFUrTlNNc3Z5R1QwU25FalBtcTZY?=
 =?utf-8?B?dUtXVmhWVFBWVG1ydG8rK2NNUzZ6ekhJZ3RNMndHeVlFQ1NuRjFvbU1WaW9x?=
 =?utf-8?B?aEpEUldpYnV1ZXVEN2E1TjFGU1BRRTUwYUsxL0VzS0FlcFJNQ0YxM3kzMDV0?=
 =?utf-8?B?WDAwK1k3NlViVmZ2OTdpMGJMWkNIbjFZWXlDS1dWd3Q5NTlGNkIwNDNxUzdI?=
 =?utf-8?B?cHBSL1Y5b1hZbVNNYWlHclA4Ym01QWZqeFQwN0RKclhxS0FKTFdtVU9sZndV?=
 =?utf-8?B?WVdyL3hCMjZvMmh4Q2tDY2NYYnhmTVQwMTl2d08rcUlXalpFVUFJT0RnRTli?=
 =?utf-8?B?b2RIS3NIcHpJUU5SR2FUNG4yRWVHT1puUVhlUlg2QVdRNkZ5bnczejlDZEdR?=
 =?utf-8?B?cTIvR0Vud1Q1R0FzY1pPY0VKMERHcXI4QlMxWmt3VENsK2dyaitjcmxEd0R2?=
 =?utf-8?B?dmRIZ3l5ZFBMMEZMdW13MGJoY05RaVRSL0xoNC81dmVHKzBnWUtHeTcrQXdK?=
 =?utf-8?B?WmxpN3pZWFZ1VDE4QzJYM2piSVIyRjYxTGxEcG5Fbitiek4ra2xrbVQvendI?=
 =?utf-8?B?MzZUT0RyMnV1UFlyNFYwanYrNUZKbmd3N0lheVZiM21NdzZHTExrSmFUVXN2?=
 =?utf-8?B?S2poQkNsOW83em82RjVIbFJ6ZXIzZnpaMnlpQ2xXb3E0NmJyUjBKcWZ0QXNl?=
 =?utf-8?B?L2IxbTJWTEg3Zmk5cXIxNzg2R2tVZE80RkcxdUpRWXdMdzViaVdzV0EraC9T?=
 =?utf-8?B?ZHk5SnErYUU3UEFFTHlVY3hPaGVFUzNTdXdwTTZsbkJkOWlGMmViRk1vMjRj?=
 =?utf-8?B?bXVoeHA2MTZyUmVqS1doTnlmaXVOcC9tb3NwanQ0b0VXNEFWb1hMMlMvcStU?=
 =?utf-8?B?RHQvTEFhZFdUYWhhSUxhdFFIaVFLbE5CZjZZTmFKZytBb2hvM2pwVkhTeW9X?=
 =?utf-8?B?cmNoQUgvTmYxTjlxdjVMZDdpZGZUU09OVCt5UFhGY2d0WTUxUGIydnVCblJq?=
 =?utf-8?B?Qk9NdjdodEhSVXB1NC9kdE9xSHdaUFFUMUF1WGxWb1lrQjFJKzJtQnQ3eTll?=
 =?utf-8?B?d1pxY203MjkzZGVpK2dNUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCt0SjBSWFZBdzVZZnFCeGR0U2k3b2JyV3o5dmVXWmZtandsMldCZXZQVlo4?=
 =?utf-8?B?M29ET09qTXozMC9PcklKMTUwbE1iL3pDdnFXWE9BVERqNDdWMTBYZEdMbFM0?=
 =?utf-8?B?T2JISDRqNjRVcjNZcWd6T29MdVF3R2JyTjJDRlA2N3dCT2xiNG1QZEIxYzJX?=
 =?utf-8?B?ajNGbDFYY0lwNkRpWEhlSjBnaHNiTUVYbHpEMWNuY0FJbHVtbHFYVlFYdkg4?=
 =?utf-8?B?cHFVWGlrb3pDWFphelFiT1V3cTBVekJMU3ZaWEl4bXcxd21oS085TWlDMDBZ?=
 =?utf-8?B?dmFqWVNldktaVmhHUk55MVZrdDQrV1VZTXFHRngyNU1VeW1oQ1l6QnY5Tllv?=
 =?utf-8?B?VkxKNXo0U3Q0M0dSVFdNU0VIMXd3bXViY1ZNbk9kNFNiTEs3NlZPY0hONFVS?=
 =?utf-8?B?SW1nR0FJSzcyOXBoZlV5UWttWHBuZlVWYURKZ29aVnBhaXdoR1BqVXdZWmhZ?=
 =?utf-8?B?SG5pdVJGRkx2L0ZrM3Y3aitlR25Za09peWdZaHFBeHZBQzNYMjZXTkQwQWM3?=
 =?utf-8?B?SmZyN0RpMENyR1FiMFdhZmZlUFpYMTVyNGlUYzVUb0pPS1BzMWRXQkpnc2lK?=
 =?utf-8?B?akg0dXNnZ1MvSlh5dUVaMWgxOFFEUjhjUkhkbmM1ZHpwRjVnZWFsOHp3bElu?=
 =?utf-8?B?SHljZU1NWDRXQVc3OWRMaGIxMWlWbklnc2VEN1c5dXMwY0IyOFVOMDRRWU5v?=
 =?utf-8?B?YUNRKzh3QjFNOEJ3OXcyWEYyby9tOFBtd0VQM21pb3BNQ1BtOCtNOVVZR3BL?=
 =?utf-8?B?WndXOUNDaVFzTFUxTFQ3L0xIWitaRXZkOVY5ZzlTV0pqTE9zUWFkTUV3QmZQ?=
 =?utf-8?B?Z0ZhdUFvVWFmQVdpY0MwQ1YyL08vTk9XdU50L0RIaWxOVWRDRmQyTklIV3Zh?=
 =?utf-8?B?RGVLa3ZTS2JCQjh0N2I4Mnd0Sm9acWZpanN4SWQzMzhKb2gxSlZXOGd0Y0N2?=
 =?utf-8?B?c1p1clYwb1NDQ0lXUWZSRStTRHo4bDJJc21xakhwQjFwMGVNQ2x3ZlljQm9L?=
 =?utf-8?B?NUkrazdBNXNkMmc1RVNVbTV4eVZvSXBHQjRpL0sxSk9LS1ZMcEk5Mld3R1RQ?=
 =?utf-8?B?K005cjhTbVdUMEFZZlpCMXFnQkRJL2xaelFyeS9UbjFMeDBvSnhRSTZtQ0Va?=
 =?utf-8?B?UzY2Yjg1dnFkQ1ZNVW1vQmU0Nm50RXp4bnRCUUNIM0FWd2I0U01rOTNIMm4w?=
 =?utf-8?B?WFI1U0w1WWFMNERnVzVZc0x1TXBWam9qQU5FTzBzV3l2WktQNTkwdWw5SlJs?=
 =?utf-8?B?b3MzWnBSYzV2R1czTE5CNldHV21hOFZYMzBZV2pKL1B5Y250UjlVOUY4OHNM?=
 =?utf-8?B?QUx3Yi9ocWNvVUc2aG1NZ0NpeHZpV0l5Z1lqRGJhdHJHazFhdldCZTZpRXcx?=
 =?utf-8?B?OURXVFhPVEoyNWFKRG5SVmx0Y2YyZ1hEcWdyYmI4ZVNZVjJOb0ZsUWNLeU5t?=
 =?utf-8?B?aWZndVJaSDhhaUNkeTZNcUh5alltdndZd05wZFl4QW1uUnlPanc3WnZFN080?=
 =?utf-8?B?eS8yeCsva2NKOW9EUFA1MUxCbjdjMTVrZDhsbUE4V1pXK01TZGRINzdVdVdm?=
 =?utf-8?B?SkUxRGU5NFBlYlFaalQ4OEFNSkZyVnJYNFQ2NHF3WGpBZUZEZGwrK1IyVDBV?=
 =?utf-8?B?b2JCWU1YVnBWenROYnYybDU1K0x1TTNuQXliMVhyTmR1dUF0NG82MU1QWmRR?=
 =?utf-8?B?aFJweEhwUzZBeGNIOFdROTJyVmQ5QVJTQWZRa1E3bXhLKzlyTmpBT0tOQUlp?=
 =?utf-8?B?aDhQSHpacEJWOTdRcUdPeDB3WHNIc0NNSlpQNlpORzhyWFJPUUVRdllweEdQ?=
 =?utf-8?B?YUY4K1VPS0xUQmdKalc3NkRHeVM0b3FHdjFLek9mQUF3ZEx6RDZEdFozR1Zi?=
 =?utf-8?B?SEp6TUtkUHd2Y1ZTUzJISElxTU9WSHM5Ylk2eWhIbWZSa3ZBdW00MlNBWFRR?=
 =?utf-8?B?VzhDaXdLeS9oOG1vMTJxcldJUVc2bEt3S1UyZ3BGV1h6bXd6cDJLNm9TY1ZV?=
 =?utf-8?B?Z0lpblNwdEc3U2FBMkQ4TERLWmsxb21jUzNuaCt3dTF3b3YyUXdGMVdnZ0k1?=
 =?utf-8?B?eGRSeFNKd0FHV2x5RTJxdkR2MldSLzNxZ0dSdGo2c29uUkpFd0FhLzlEcWJR?=
 =?utf-8?Q?GhqhaR9wDZyuABiYhzOUeesQ6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SXTqoSjEOhNPqqlTlrPTg2h9n952BVG6hRLFgO1E8VCtSbCEJsTtCbDiS5aNdFwmhkD8xjkM0/Hu8MsHZt9zcDtXgc89b8IIUQKDD2nNMDpk/+KwkAtaMqvSUgELTVQJhyYqKpFeQZMSzbTfH0fvHBgNtFh19UcjRrha0VTRI0g7qrgE1eMw05JWllrfbKeq0u/G7exgzWpJWVWBw8BeMUPXC6YM53YREE+FJrlbfSWQqJtRU1TGTSKr4vT76ZxzbORpYADxhWTad8LVEL2+hUCvYeffoM19Ap5ax8ogVxnr1PuOcEEQPcFbMw3qB3YRv5IBZOWJJa2jTLmtVw55g5kHAuhmaqP4tHHEYu+U9q/Tmv03eWdiQziwMQJl+srBDRED8uJrMTXTHsBZjnP4nbcoNl4A1UTD5//+d0Dg53tE3LacQogJ0I6HyTPSvzpXGd9eBBzKsl0TUWpGZRyHAXCxCJYYrgG3VxFmtuRfcu18JErI+TQyhW95BSs/cRfsRw1rcX//bTzQ5yJs455g8KCEaroc1Lre3ES2P8TlSvWkSJPA6wWrKHxBswqBcHj6aCJ0zwcRG9PS05rSxktgrqUtdvxcMU7jbc1Qqw7drb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3d6792-7cb6-4997-f9e6-08dd55ca337b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 18:28:29.6037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvRozHrvav0eW/tRDvE8aOSpxDJYdoKWZqpJYDEHOeOs1id2AeVolvomJTo1a+7/bPss1eOqfoqkMYuEqWvBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7480
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_06,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250116
X-Proofpoint-GUID: jZPiGsSe-JF44WpIEbWzbvewA5wEF97l
X-Proofpoint-ORIG-GUID: jZPiGsSe-JF44WpIEbWzbvewA5wEF97l

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/23/25 21:49, Sam James wrote:
> Noticed when grepping for something else.
>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>   test/unittest/io/check_io_probe_args.sh | 2 +-
>   test/unittest/io/dump_io_probe_args.d   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/test/unittest/io/check_io_probe_args.sh b/test/unittest/io/check_io_probe_args.sh
> index 50dba6c6..8e1f5a4c 100755
> --- a/test/unittest/io/check_io_probe_args.sh
> +++ b/test/unittest/io/check_io_probe_args.sh
> @@ -6,7 +6,7 @@
>   # http://oss.oracle.com/licenses/upl.
>   
>   #
> -# @@skip: not used directly by the test hardness; called by other scripts
> +# @@skip: not used directly by the test harness; called by other scripts
>   #
>   
>   infile=$1
> diff --git a/test/unittest/io/dump_io_probe_args.d b/test/unittest/io/dump_io_probe_args.d
> index a28b2d61..5b5ba90f 100644
> --- a/test/unittest/io/dump_io_probe_args.d
> +++ b/test/unittest/io/dump_io_probe_args.d
> @@ -4,7 +4,7 @@
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> -/* @@skip: not used directly by the test hardness; called by other scripts */
> +/* @@skip: not used directly by the test harness; called by other scripts */
>   
>   /*
>    * For all io::: probes, dump "all" probe arguments (and their interesting members).
