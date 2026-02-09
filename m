Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D62FB997
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 19:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664641; cv=fail; b=nEQlqp+kJV2vdCWkKumXCGCdsKLBssBZxAyPFjw7i6QhFW/qGI8hFbHgzK91Z0nSR3LVwxhPHuNr9lP79wDCPj1J9W9Hn/KSsZXX3UG5iXprw0AL4UGw0rXAgLLZ8vbcQkvfPfC+cU3MiO/HYAaZH18Avs54N3CJ026g52SYuqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664641; c=relaxed/simple;
	bh=IF/yB94MhxEkn9/EskKzmJt2pHKW//DDtHYZ1HNTawM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A6u0LOFzGwdSzayofzMX5A9dD9mhgBfXeDUm+E1wHcmNjEpuG8G5/vy/XpjfVvgtB6JrgeJne2HKA75mi9l1Vqm8LA60/cEKxOaWZXzCMDY7+Y7k3lcM4eJTij84ZeZpK5kVaEVS8DqmcOIxq6GqIHrD1LNyQDtA5AYF60O1k7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WtG3glkf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XMkp5WfX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WtG3glkf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XMkp5WfX"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECYV31628013
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ULLSQvjDnMhfjVj/O9vXzlgiKgVB6PPRHJ/8qSX1E0M=; b=
	WtG3glkfP+aOoeNs3DtCWJAOMAn3hUYuSnHxjN0XRpDSVClJZr8g/gQ6t6Z2s+Ga
	GqbZaZT+KUHdpvEv63re9MA9MVBcXAoQ546eoJrzThK1DRcSDnP2GSw0V8jdCJ30
	zQJgHl4AOcjZZ4JaA11OGpcqcHrUATtV56a8s3CaYLz9fEEkdZ04koyjWQ23HP8d
	Grq9Vlv5svVQwERBKtIBSHMJ3GAgXeFVPI/r79LHrelzzEcT/CNJ+BbXpxvPOLLP
	7UYsnxgm4MxmzXDOpJ6ku1B3czJ1hbcO4bSceU0VDeCsblKEIRTEnKhDN4qK9y1L
	hhIPMDutJBVw5zG23bbp2Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xh8tjud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:17:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619J0Tjp030930
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:17:19 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uukx5hs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eM4kWYKyyREQzC28bF5V/GJ5oBDk2eCn3wif/YXnKR3wmw2TOitx2j6oSEJaJfAo+weBwFNrbWgv7D2fDnjcZ0dDIv6TyjRsGny0QsBwFSUo7gR8ye6tpPhZ3LK7Krqm1wsl8skRNUdj1dS7cQbihVa4Jkpxc6QJezLhDUJ63oxnFie+J3ZzvLLIqnwsdKx+Re7nu439h0Xrluom+QoVLVI25JJxIXqIhHhA8f2BiNSeRyuT37OefAYf1MvbzAr0OBn089D10lPvXVAjEcKV6EGgDRMnRPjj4w/FcF6N7UaOg5FoRwIEYktFlcP1vVkukzRuioNILTgnFtNbEJ+SsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULLSQvjDnMhfjVj/O9vXzlgiKgVB6PPRHJ/8qSX1E0M=;
 b=g+Eu5kLKuhU61KlimYcqWnqrrpAkEN/MabNnW9330c3zdlOU5hrCOZfC1WodofgwjbNKdpSPg/jHhHOD0b9gztAZNg7YvfI9C7wE9HaE/cJhZjeO1VKU4SV5PDAPAms1FeHuUgcc+K24RkgZPXSBcyUD8mxLKWmLBdl8H4w+X78sndowt5O4f0wd3rsOA7jyqADa40RRF/0zj7GTfAnRH02PVcLZRW1tyRUyRqtN+tpv1UZkjjFGI4z93feOBpwFSXjpirL4VYgepU94Dwji4nI1AJlKfuci1xMtAzKpLvkjSYMETc/YY0eYp6apw/dwScERRTuLdGUT6XC9btAUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULLSQvjDnMhfjVj/O9vXzlgiKgVB6PPRHJ/8qSX1E0M=;
 b=XMkp5WfXysHc3OAJcd4xyrG7FFo9rAVTYOe46JkWTp2e1dLKnyA6UZw938pDcRBebI3Y9c0ikzdkSogg8/VqE+0gqWssT1PDWR0f+kSnj8xCL4pZGVsko4zoO6JXHlYqm1B2bwBKckVoyuKp2A7icvY3VcdRyVaSUWupRxWtfTo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4349.namprd10.prod.outlook.com (2603:10b6:208:1d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:17:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:17:16 +0000
Message-ID: <8d98f07f-23ba-1ec9-0c78-7f567dbedf94@oracle.com>
Date: Mon, 9 Feb 2026 14:17:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] syscall: fix syscall probe argument handling
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522898037241A1EC99BBC06C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522898037241A1EC99BBC06C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:510:2da::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4349:EE_
X-MS-Office365-Filtering-Correlation-Id: 37727085-f46d-4b44-2f92-08de680fd65e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXJMMEVQTCtvS2FWZDd4NytSWVBWS3dUNWkvK0JZODI3NHYyQ0xSdGFmTmE2?=
 =?utf-8?B?aGhnMytOTTluSzZGMkZ3Wjd6aEFWNURuMDF3NVJRdW1qVEUwWm8vTHdmbU5C?=
 =?utf-8?B?QVVqWlk1YmN3VHRlQnF6ejlKQkt3ZXVBNzA5SDhjak9jL0g1NjhXOFFUMHRt?=
 =?utf-8?B?NCttTjZ6bjFwMFY0bDRPYzBCN3REUDF2SkRPUjMwTUdQbG41Z00vNnJMZTgx?=
 =?utf-8?B?ZER3QXBleVBSZEdZYkFWMTlaaHQzZDN4M2JLQjJLV3lmU2dTRFRoTm1kVVFQ?=
 =?utf-8?B?VCt3Qy96bGcrVUJZSUI1TVVvdU8rR2VwS3krM1lhWkV6MHFEOW9COWFWM3VO?=
 =?utf-8?B?Y0dTRG4zUXp1UGRpVnhXZDlxN2JtS0h5WkV6NE9JM1ZNd1FRc0lwQmoyMzF4?=
 =?utf-8?B?SlhwMjFDOUprV2tadW53TDd6REVVbUdmY1FBdlhHTStpUk51M3FGSjgxbjRQ?=
 =?utf-8?B?T1FxcHcxbXdsSHMyakRpN2FEbENFUFI1UXlYOUNTYjA0RCttaHlnMUZVTkxH?=
 =?utf-8?B?bm01ZzVNQUJvaSs3Z2F6REhWdFNqTy9oUHk5UHJjVlpOSnZQU25MdTNXdHhU?=
 =?utf-8?B?UktNeEdJZTdZeVhGOUQ3UWYvQVdEKzROWHZFczM0ZTI0QUw2ZTJFcUhHcEFR?=
 =?utf-8?B?RWVCMk9BUjdWQ3ppY3FXMFhUbCtGMCsvWTJ1NHR4S2RtYzF2Skl3WlN3OFgv?=
 =?utf-8?B?NmdEeGF2MDlSY3B0WDB0bk1MWUxXWmVNam9GeWRpOFl3Nk1HZlVtaitFM2RX?=
 =?utf-8?B?S3BXNktzcUlnY1R5TWdQMFcxQk9SZ05LRnNkR3Q0TStmZjZNR0RwV0MwNDhP?=
 =?utf-8?B?azBEZWhZbi96WjhYMU1lRVI3cmxtczhWTTdjUG9wUjdwUkpCQnl1ckJXTk14?=
 =?utf-8?B?cWFldldCRFZvZ25ldk1tcjkxS1hOeW0vVXBmT2ZxUlc5eG93ZnlBZ29oTWcw?=
 =?utf-8?B?UHd3VjA5Tkk1K3RPajNaVDBnOE5FZi8vUjRCaTlUc1hEeVNvZ25oeFZnQjJZ?=
 =?utf-8?B?QWtUaUczTkIyL0RlT0hXci9XUE42Y3UwNXRKMmEwVUJjWmxIQUtFTmp3MGZF?=
 =?utf-8?B?RHJDeDh2SFlFUkZtZVUrd1JJYUJjVGtkOUdZVGk1cWEra0ZFS2RRVTg3a3NJ?=
 =?utf-8?B?aUJZUEIzWVBEdGFWL0ozclNqMzd5UkpEMGhrL0tRMk1IV3QvNEZ2Y1JVdXpE?=
 =?utf-8?B?aThrUWVNcS8vaVcrUWJrdzZRcXZFTXZySThTeUNLakxQbGJMSU9BNngyWHFy?=
 =?utf-8?B?eFNweEdUZXBtRExidC9XYVhXYUFpYW9IVjFIVFlIZzJIeWVZK3A2c2RVelNL?=
 =?utf-8?B?U2t4UTFiTytZckt2NmlCb0ZyN3BKOXY2RUhNL0RQMTVwRWNmcHBJcVRJMGNu?=
 =?utf-8?B?SjN4dnhENDdjV0lTci9LLzA1WVMzbHRseHFtbVYvUmQ0ZFpzOElZTXlGbHBh?=
 =?utf-8?B?WlRGbng3Y1pSV0NONXgwUlFLcHdtdGVaT2ViM2VFc05yZzBjWUY0R1d6SDVW?=
 =?utf-8?B?U2s3STg2cE85TVphSDM4V3NrcURTQ3Y2SEVJRjMzTkhGd0E1SFQ3bTY5dTNl?=
 =?utf-8?B?RmR6UUl5YlgzYTIwUW9WNDN3MFp5SVg3aFFNaXlPa1pjQnNEMDEycXVZdDJS?=
 =?utf-8?B?MkJPdHdwbXBJKy9iY0FmWEp5aFN2a0xWL00zRmhCN2d5ZCtZNmd3RTZnYnh3?=
 =?utf-8?B?ZDF1eTRvOGpLYXFuZDNHUzA3WjVBWkQ0T3RFdFNGaWVMZ1IzaUplaGk4NjJR?=
 =?utf-8?B?dStXdjYrc1JQL3FWS3FaOU1tREY4cTVqVTB5ZHFpVitmT2plVGh3bEF6S0tt?=
 =?utf-8?B?TUo3N1BuSEh3ZlRBdGhyNVcrY3dBT2dDczJvc2xwN1RGQ2dkZEVFMHZzVnIy?=
 =?utf-8?B?cG14ZEZGSkI1S2p3OGI3QkxPRGNGYThlK3dwSXBrQ2pZRlgzTmJNZm1RVnFX?=
 =?utf-8?B?TWt1bzZmVmZmUlc1cE04Wm9JUWJSRHp4N1NqOFdCdWJ4VElkT3QrS0hDdnQ4?=
 =?utf-8?B?TDJ2MDdHTXdWOGExOXFZZm9BL1dtU0JVR1UxN1ZGVklEU05JaTMrdFZ2SHl1?=
 =?utf-8?B?bWFpenV1Q2RqZ2tpeW9RSmhBZHRoSWxKWEUwYnorZmY0RjhtUVNqczMrVjNl?=
 =?utf-8?Q?qA7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJDWEtwUUxaQUorVDJWalNIWW5KeEp2ZEpYVVUzM3ZOOXpZQnJpaFFRNS9Y?=
 =?utf-8?B?d21RZVp4RlVSY2pDc3B4ejdpVEpaOFYyQWl4OHBsK2trTE02eEtGNXVGNlFl?=
 =?utf-8?B?SXdEOGRKSVAvdERxVUExMkNZY0M4TklXT01RYlhGanZUbVY2MU5BMk1QUVgv?=
 =?utf-8?B?QXEwOVJVeCtsS0VXbEpuM0diYTNxNCtRVnpGSUIyV0V5VzZ2ZWNkZ3NXd3c1?=
 =?utf-8?B?UVZyOGhvK29xbWwvQVRZR29DaEVGYUVNcXRIVHRNZ1p3MVZrbytFbXkzbXk3?=
 =?utf-8?B?RjBXeHZwVFBWQXdGT1dxbllJYUE0RWt1azlzSVdGN2MwVzNwVnZCVW9tOHhP?=
 =?utf-8?B?cFg1ZzBKa3V1eUdoNGtsN0hZd2ZhVnVQWElMek5oTGwxSHV3MzBPRmxkazQ5?=
 =?utf-8?B?eGNqc0Y4dWRXc2tpNU4wU2dEa3pJSngyenU0YVlzTWdiNmowL0VXTC9RMlUy?=
 =?utf-8?B?UU0rRzlSN0RWemFpVmNsYnBIaERiTmdYcDdYKzlDWkNZYXg2NkVqQlFFOWw1?=
 =?utf-8?B?STQ1ZlFmNi9iamUxYUZYNWEydk5YWllvTUFGZ3JSTGdrNk5Reml2bjIxY3dP?=
 =?utf-8?B?RTFFUVpSQXIzMDBQS3Q2UjBpWVpTZVZpbU5PRExNeC9md2FodFJVa0ZoRE9R?=
 =?utf-8?B?THdCRVFwMVJFNHJDdGo3YXBvb3dTa2I4WTVSSjdPNUdqZWt2cG5hNVdzUVBW?=
 =?utf-8?B?enRkdEovSlg0b3dQTjQxQk5pb1E4Sk1tYzN2OFdENlNzcXlycitLeE5MUEI2?=
 =?utf-8?B?Y1F3blljQ2ZFWHZOb0NOMTMzSkFVU1U0OWgraElvR1kzZTZMbUYyeGtrRmpY?=
 =?utf-8?B?QVZBd291ZlpjRkhRYW4wMk1XRnMwbUJoMEJGSDg3cmNPbmQ0YkExRXZRaHBo?=
 =?utf-8?B?blRsUUZOSFNvYVZrMC9Ba0U1RmlGU3UvU2VhMnI1NFBqeG5NM3NpTHFKZlhh?=
 =?utf-8?B?b285Z29HZHJmQ0l6TlkyeDhXTldBbVd2L1JXRU5FcXRBYzNBMnRvcmVwT3F1?=
 =?utf-8?B?elcycDlLWktMYVpLUDdsVHRnWWNMeGt1RlRqTFRqRWpCSGhkellTaERVNzVs?=
 =?utf-8?B?aS90ZUJlT3oxNWxEcld5ZjhqdXVZQUVsNTArQkdMK1lBRzlEMXlPdU9KTHFG?=
 =?utf-8?B?clZCY011emJ3SW5yVi9zcU1Ma1htQ3JFRTNNc2hqeVh2QWZXY21xaktGaDZt?=
 =?utf-8?B?Q2FiQzQ4VkRwaTRRdjRpUHlnTnBOMVZOS2UzSjhSbkpxZHJabklNS0x6dHh0?=
 =?utf-8?B?NGxkdjBLY1lyMHF2U0ZVeG5iTzFxclVvcUw5Tkh1WWg2SlFPNE5keEVYZlhP?=
 =?utf-8?B?Q3lkSTlEZmpFY0lsNHJoTU9BM0VYYVFoOWZjYURjSG9LKzE4R3IyVXdWcmxG?=
 =?utf-8?B?Y0UzL3hEZG1UZ2FFZHZBY2xGWFUxMlBod0dubEFaNkVBeUY0b1dLRFRzUlFT?=
 =?utf-8?B?SjVJeUNueWhVRHlPUGRBZCsvWTZSc2twZFc4KysxOE5tRytTcGMwK2VhOStx?=
 =?utf-8?B?Vm8xMm5wWEtHeldaQzV3THlxMmJMOTZuVjFrSU55WTFvQWNQQmZsNFI2MVc0?=
 =?utf-8?B?czVOQ1JkckFaajRhZHB6ZDZNWkFXaEF2NUh1c0haV0pPVUJOM3dteUVkRlJo?=
 =?utf-8?B?V00zUVlaK0VoakFOUzBsMENYclA3M1VvTEcrdlZFcW5QdDVsVGlaK0VtTlBj?=
 =?utf-8?B?M0x0eDJBVmtWYWdBZlhFZVJ2b2dQMTRaOXMwd1M4cTY1dGNHMXZzandHUWs0?=
 =?utf-8?B?ZDQyeGtIbHYrZEtqajB4UDR4anY1Um5zVWhVb1dhejd2Y0lGUVZOTlNSRHFW?=
 =?utf-8?B?bFFkTGhITVZqTEJpQ1hCbkRPN2kyVWhZM05teE9LdWV1cDR2T1JBMllQSS83?=
 =?utf-8?B?R3ZJTlVHSElFcFc1MG80WnRLYnh0K1duTitNNk5IQUxUTG5lUE9CYTRobnBz?=
 =?utf-8?B?dW1DckZ5M3M5cHdWOC9GNDNXQVZkdjBhcG56WlFhNHp6ejhRenlvb2loQjVM?=
 =?utf-8?B?dlNLUEhzbnVrU2RYekZWblJhTll4K1hHaFBTSm9RQlFjWjZkbkVzTTRHUFVR?=
 =?utf-8?B?WjB6ZjlNU2l3cUVCeFVPMkE0aDMvL2E1L3NDVVdMRmVCcjdjV2h6eXU0OXF4?=
 =?utf-8?B?ZHZhUVZsVTJ2ZGxTYTByam5hMnMxVUpMaHRQY05PbUZkZDR2bjJmV0RyNDdR?=
 =?utf-8?B?NkdSR3pUL3V6enFuMU1TcTliWWlDNUZscUM4ZE1NYWdoUlpQSXpGcHcvWVVr?=
 =?utf-8?B?bGkxK1U1VnN3L210Y2MzdHpWVUxaNDZ2eEpUajlCYWk4dERpY3p3OUttMlVW?=
 =?utf-8?B?VU9SM0lQa213MHBmc3Z5cmhYSXlqVEhzUVM3czJRRjN4TjdHQmx0dz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hRV/Iuela56IRqL6TAd3ElW80zpa/TkaneXUF4/TG0hAxFTf56tacBugk4mFIUFi2+1J2W3WS+gB0JlQgedNe8h1+1AfK8vg4m0NM6PWLVrbddSGST/Amwv00DR9g9zjwMhtukhktvDMDOnOwQsPYyw/uw4JiKo/I1lXXmKZqlmB+Vg9eSxIiUcjol8jxbK87e+hDdnAhW5LpVd4756FWkBNNIfxs1keodd5DDdnabhGE81LJYkJqV90vrkH9CXSpoCtRSh5a8R+qcFddnKYpnlVwVML9EiiIB+odIG0x9+000WEbzOGmo2DmD51ixixyLMglZXd8xIwTwKZLW14n1LFtxrRz/1NzKv+O/BIgbyIsRc4VB9Om7JjgDQNelfEP6dGHfmhoklFhgTBI3R6VCGwUARt4wGaw7ZH6PT2/2cUa3WYV7Uwez+TrXZZB/EPTM6FcIEdwvNDNRXuIX186u0lk2HEvAux6YRnxjCJRgDh5gBjCV1srk84sqEVf+YY+blGY2YahvqiCPbf1NjqtGq0B8hy3lwsUspnAk3a/k3/sUopmeJ/5n+OFkHs+FJ0V/cP0/Nq5G7WmdUzFnkd90cd3Ir2Ctn1fAK2dLBJcJE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37727085-f46d-4b44-2f92-08de680fd65e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:17:16.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBIxZgEkrfZybRh9ULnH5qKrauD21xvZJF+euqiqXz96IJ1oe1NnBzYrUk+iTytSuSrJ6SeIOXCnKql8wrpffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090162
X-Authority-Analysis: v=2.4 cv=YbOwJgRf c=1 sm=1 tr=0 ts=698a32c0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=9nSFC-9Pvd1xXuEOLrcA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13697
X-Proofpoint-ORIG-GUID: Q_EWpPAUxwEVN0LTvS7XxA33e_zB6f32
X-Proofpoint-GUID: Q_EWpPAUxwEVN0LTvS7XxA33e_zB6f32
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2MiBTYWx0ZWRfXw5SoOyqyfA2X
 PQxLl9CqDBZdwCaHk0/7iZm1KUDQbZvqKejkvErTfpTvf74af4yTk1QhJ4KEt5IVV80jJnv47Gi
 5E057tWLqAkPuhGEhQIGKjT6BF+6ZjmWPWgCG0pey0Ul61qlxBjyd8HzdyKQHy5AZ5rb57x7ue8
 S0khH5bb/Mw5ZTdX7sVxtzj3J27KVJXVNbs4KZkiBL/uAOlD9LSSvVMhjt94DG4N+WxqBnfqg9e
 eiioD1UW3wtt7YsuWXn+/S91faYj+FGcdgXiGrwWw/pcoT+j3QxlNp3/KAIj+Lg+z+MBrOtviyr
 k7VSlpkv2v8/bheAawy/c5NrKwJBLy6x/7fKWMJyJJJlAR4MWBv2qrcoyxexSin4nG0KCvcZqMX
 ed5JDtTSRSbncB/bVvQ442mZNtEehz7wvWB1gpoYXYD4LIKqfZzbSLgnkwyHeyJdECFVB6qdnyK
 rMZFSBbKw9pzZQ76ev4ZneXXLP/JroaV9PPE8nH4=

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/9/26 13:34, Kris Van Hees wrote:
> Kernel commit a544d9a66bdf
> ("tracing: Have syscall trace events read user space string") (added in
> 6.19-rc1) causes special fields to be added to the tracepoint format
> file for data strings that are faulted in.  We need to account for this
> when determining the number of arguments for syscall tracepoints.
>
> We introduce support for a valid_arg() callback function that providers
> can implement to support skipping initial non-common fields and also to
> stop processing fields as arguments.  The syscall provider uses this to
> skip the __syscall_nr field, and to stop argument processing when the
> first dynamic string field is found.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_dtrace.c  |  2 +-
>   libdtrace/dt_prov_fbt.c     |  2 +-
>   libdtrace/dt_prov_sdt.c     |  2 +-
>   libdtrace/dt_prov_syscall.c | 42 +++++++++++++++++++++----
>   libdtrace/dt_provider_tp.c  | 63 +++++++++++++++++++++++++------------
>   libdtrace/dt_provider_tp.h  | 11 +++++--
>   6 files changed, 90 insertions(+), 32 deletions(-)
>
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 9ef001a3..a0bf34c3 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -255,7 +255,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   		if (f == NULL)
>   			return -ENOENT;
>   
> -		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
>   		fclose(f);
>   
>   		if (rc < 0)
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index ed1bd93d..59e4583b 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -526,7 +526,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   			goto out;
>   
>   		/* read event id from format file */
> -		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
>   		fclose(f);
>   
>   		if (rc < 0)
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index f9de2cf8..b1343481 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -202,7 +202,7 @@ static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (!f)
>   		return -ENOENT;
>   
> -	rc = dt_tp_probe_info(dtp, f, 0, prp, argcp, argvp);
> +	rc = dt_tp_probe_info(dtp, f, NULL, prp, argcp, argvp);
>   	fclose(f);
>   
>   	return rc;
> diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> index 4f1e206a..5dcacf60 100644
> --- a/libdtrace/dt_prov_syscall.c
> +++ b/libdtrace/dt_prov_syscall.c
> @@ -40,11 +40,6 @@ static const char		modname[] = "vmlinux";
>   
>   #define SYSCALLSFS		EVENTSFS "syscalls/"
>   
> -/*
> - * We need to skip over an extra field: __syscall_nr.
> - */
> -#define SKIP_EXTRA_FIELDS	1
> -
>   static const dtrace_pattr_t	pattr = {
>   { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
>   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -186,6 +181,41 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	return 0;
>   }
>   
> +static int valid_arg(int fldc, const char *desc)
> +{
> +	char	*p, *q;
> +	int	rc = 1;
> +	size_t	l;
> +
> +	/* Skip the first non-common field. */
> +	if (fldc < 1)
> +		return 0;
> +
> +	/*
> +	 * A non-common field with a __data_loc tag and __<name>_val name
> +	 * indicates the beginning of the dynamic data area.  The previously
> +	 * processed field was the last argument.
> +	 */
> +	p = strdup(desc);
> +	if (sscanf(p, "__data_loc %[^;]", p) <= 0)
> +		goto ok;
> +
> +	l = strlen(p);
> +	if (l < 4 || strcmp(&(p[l - 4]), "_val") != 0)
> +		goto ok;
> +
> +	q = strrchr(p, ' ');
> +	if (q == NULL || strncmp(q, " __", 3) != 0)
> +		goto ok;
> +
> +	/* Done with processing fields. */
> +	rc = -1;
> +
> +ok:
> +	free(p);
> +	return rc;
> +}
> +
>   static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   		      int *argcp, dt_argdesc_t **argvp)
>   {
> @@ -209,7 +239,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (!f)
>   		return -ENOENT;
>   
> -	rc = dt_tp_probe_info(dtp, f, SKIP_EXTRA_FIELDS, prp, argcp, argvp);
> +	rc = dt_tp_probe_info(dtp, f, valid_arg, prp, argcp, argvp);
>   	fclose(f);
>   
>   	return rc;
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 1faf5cd4..6e0d908a 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -123,17 +123,16 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
>    * array dimension specifiers (and those are part of the type).
>    *
>    * All events include a number of common fields that we are not interested
> - * in and that need to be skipped.  Callers of this function can specify an
> - * additional number of fields to skip (using the 'skip' parameter) before
> - * we get to the actual arguments.
> + * in and that need to be skipped.  Callers of this function can specify a
> + * callback function (valid_arg) to validate a non-common field.
>    */
>   int
> -dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
> -		 int *argcp, dt_argdesc_t **argvp)
> +dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
> +		 tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp)
>   {
>   	char		*buf = NULL;
>   	size_t		bufsz;
> -	int		argc, common = 1;
> +	int		idx = 0, argc = 0, skip = 0, common = 1;
>   	dt_argdesc_t	*argv = NULL;
>   
>   	tpp->id = 0;
> @@ -141,10 +140,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   	/*
>   	 * Pass 1:
>   	 * Determine the event id and the number of arguments.
> -	 * Skip over how ever many arguments the caller asks us to skip.
> -	 * We will skip initial "common fields" as well.
> +	 * We will skip initial "common fields".
>   	 */
> -	argc = -skip;
>   	while (getline(&buf, &bufsz, f) >= 0) {
>   		char	*p = buf;
>   
> @@ -205,7 +202,31 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   			common = 0;
>   		}
>   
> -		/* We found a non-common "field:" description. */
> +		/*
> +		 * We found a non-common "field:" description.
> +		 *
> +		 * If the caller provided a validation hook, call it with the
> +		 * current non-common field counter and the description text.
> +		 * The hook returns
> +		 *  -1 if the field is not a valid argument, and no additional
> +		 *       arguments can follow
> +		 *   0 if the field should be skipped
> +		 *   1 if the field is a valid argument
> +		 */
> +		idx++;
> +		if (valid_arg != NULL) {
> +			int	rc = valid_arg(idx - 1, p);
> +
> +			if (rc == -1)
> +				break;
> +			if (rc == 0) {
> +				skip++;
> +				continue;
> +			}
> +		}
> +
> +		sscanf(p, "__data_loc %[^;]", p);
> +
>   		argc++;
>   	}
>   	free(buf);
> @@ -232,7 +253,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   	 * Fill in the actual argument datatype strings.
>   	 */
>   	rewind(f);
> -	argc = -skip;
> +	idx = -skip;
>   	while (getline(&buf, &bufsz, f) >= 0) {
>   		char	*p;
>   		size_t	l;
> @@ -249,7 +270,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   			continue;
>   
>   		/* We found a field: description - see if we should skip it. */
> -		if (argc < 0)
> +		if (idx < 0)
>   			goto skip;
>   
>   		sscanf(p, "__data_loc %[^;]", p);
> @@ -320,13 +341,15 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>   			}
>   		}
>   
> -		argv[argc].mapping = argc;
> -		argv[argc].flags = 0;
> -		argv[argc].native = strdup(strp);
> -		argv[argc].xlate = NULL;
> +		argv[idx].mapping = idx;
> +		argv[idx].flags = 0;
> +		argv[idx].native = strdup(strp);
> +		argv[idx].xlate = NULL;
>   
>   skip:
> -		argc++;
> +		idx++;
> +		if (idx == argc)
> +			break;
>   	}
>   
>   done:
> @@ -413,12 +436,12 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
>    * the argument types for a given probe.
>    */
>   int
> -dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip, const dt_probe_t *prp,
> -		 int *argcp, dt_argdesc_t **argvp)
> +dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
> +		 const dt_probe_t *prp, int *argcp, dt_argdesc_t **argvp)
>   {
>   	tp_probe_t	*tpp = prp->prv_data;
>   
> -	return dt_tp_event_info(dtp, f, skip, tpp, argcp, argvp);
> +	return dt_tp_event_info(dtp, f, valid_arg, tpp, argcp, argvp);
>   }
>   
>   /*
> diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
> index 406609d1..bf73d96a 100644
> --- a/libdtrace/dt_provider_tp.h
> +++ b/libdtrace/dt_provider_tp.h
> @@ -33,8 +33,12 @@ extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
>   extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
>   			    const char *name, int bpf_fd);
>   extern int dt_tp_has_info(const tp_probe_t *tpp);
> -extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> -			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
> +
> +typedef int dt_valid_arg_f(int fldc, const char *desc);
> +extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f,
> +			    dt_valid_arg_f *valid_arg, tp_probe_t *tpp,
> +			    int *argcp, dt_argdesc_t **argvp);
> +
>   extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
>   extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
>   extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
> @@ -44,7 +48,8 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
>   					   dt_provider_t *prov,
>   					   const char *prv, const char *mod,
>   					   const char *fun, const char *prb);
> -extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
> +extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f,
> +			    dt_valid_arg_f *valid_arg,
>   			    const struct dt_probe *prp, int *argcp,
>   			    dt_argdesc_t **argvp);
>   extern int dt_tp_probe_has_info(const struct dt_probe *prp);
