Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B638D
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 00:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165158; cv=fail; b=OUY11j+SMRsd/jI9T3Zr9ajyWjPWrNK32GRXnKo1hUc8G+0WYOeWBsZeG3Vx1FO3PYl03+/iH4KnmRQpcsb5pk/I3S2PfW45G9PRx062mkSd3CLwuEnYM6bTqy+AehoyUYHnDgzfzvlPvX5WpSCd4L1TVFvPgovaaAHiaRqYAFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165158; c=relaxed/simple;
	bh=PATBkkgneBu5TN4znRkMPVN4q8+tkhENLCzPTxbIRq4=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oe3xgXYLkfm++VQIpX8zc9d6fRk/uuuj2CHvkprZOUoc0cNOK289dyEtQ8z7rZ7mxF6dZzo/Ossqqu8wOufXGSCl7Cv6dD2dE/JKEMzf4f8BIgGTuUwWvTHl8WeNt407cNwOXQsNHoO/IGycVV227LV68QmSPL7KdwUhPdnoyGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AIfg5UXF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bjSz+qYA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AIfg5UXF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bjSz+qYA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuDG54087859
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 00:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Jefkl1Lgkdlo7sRrCqDNjyN26Iq5dKAkpTI1GnG5ULI=; b=
	AIfg5UXFWOxh2FVSgayra8r8tRwIV5Q7Fshe6Pco000xTXDoRe9K6RrwxbZrhaVj
	De998C1SmlsLVbMDNputwRrbPU2HQxQ++83mwOT4r2Ph8aVOC6guSbCN6qmbvnKk
	OUIJVmgliial1OBFHFtqbZINfzmiEREQithi12+ayeZ9TjE1j9WVeOr2im+i71RO
	ipT9JuZX8MuLSnXifMeZ0HIbaEt5KzK4QBpdxEhOekKA78OaCVD56FMR0tnrpSTh
	d7gooQnUkEeJbbQ9CdvbUUAYZxWF7zecVUHu1TkRQYEFf79rBJ6YKZoiP4oEPBbp
	nOXhXy1ZbwhNuxy0zEAAdQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3jhb10cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 00:32:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6140UrtJ034794
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 00:32:35 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186an59m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 00:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/0ZTznrSMze5+23Vxr1fcmk+fMiqiWiJHSZFkAhpOTX4s8twViiU+yX97gv0QIYrkR6kU8tAD6LMbOIi8xp47JIcO7mGZqBax11j1Bz7abAIEGBmQlMA1M16VT2nQcp9q1OKcJiw5afZlAo9tp+GZZK66lo6XrDTw+OYumCqZhoxQRRNG9I+F823oKswi7wdlhTp7jQLv94YZR1n7GA5wSUudR17PqfKcNJyY63pw46NALsPvd/WNwwp0F3m5zc1ObUS/so0yTKU3MvK3q/p8uUugsDmBderdNEOr2lmGMJcGpc6mbXJIUUtBJwDoHBBpU/Y45Nq8DtCPW4qjJ61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jefkl1Lgkdlo7sRrCqDNjyN26Iq5dKAkpTI1GnG5ULI=;
 b=BYqQagETxRgxdUovVPwIDjjqat4qFzCc40loIwNTHcKppVpcTN9H0osqt8UlaQM3SkPM3Ytg+Jn8tlPg2eA8TfiJRIo2CSWldXEqSb4f6+UdYrfhfYReeECr5aq9MkwfdXdFTytAhXmawmY86ln76rDqKGHVBXJfgpwj2TkZ+E2fOPUgwWmVUjFWLrsnmkRWRRrOKEtA8/IOkP80VtXey/83QiRDcHpuF1l8yciA9x7ihQGss54QczOZZSVXfS3Kx9PhVWKCOMH7hFYVQwFmeO+dD75Yz3tSK/Rf7kHeokHJIXqr8PS17lvs6EGRHQZ8bYEWfici3A0cbY5Cs5Hseg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jefkl1Lgkdlo7sRrCqDNjyN26Iq5dKAkpTI1GnG5ULI=;
 b=bjSz+qYAOGBerklevJvHi8NJQrzeNUaKQZTMUye/9X3DmZUzoKKmp1qf8Vqn6tGjVooAtYmsDqbuexnXetqPMd3s+IaKe+YxcX5Kpf0bVGEf1DC6wxdNCgX6z6AEkNqxdny9Ez7QVDDscB4UOVzWZnf47Q9cjtST+24jWI6rW5E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA6PR10MB997563.namprd10.prod.outlook.com (2603:10b6:208:5e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 00:32:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 00:32:32 +0000
Message-ID: <758ce825-fba0-edd2-1701-f182555b267e@oracle.com>
Date: Tue, 3 Feb 2026 19:32:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] usdt, stapsdt: fix arguument handling for multi-location
 probes
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <aYJ3Q3oBklx1lGAQ@kvh-deb-bpf.us.oracle.com>
 <a1d50720-a420-9171-d1b5-c3deb4f746a7@oracle.com>
In-Reply-To: <a1d50720-a420-9171-d1b5-c3deb4f746a7@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0178.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA6PR10MB997563:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6c1036-bf98-4744-55be-08de6384e2b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDFsSE1ndkU3L3gxVXk2dm1QRkJCdDVxR0ZmTmltaUFBTnJqZThwSm0vN04y?=
 =?utf-8?B?VG8xdVFZTjQ1VHNid0MrTU5IMmwyRk9HVCtJTGdGMzBzTlhWQ091d0t1RnI3?=
 =?utf-8?B?SzZzZVF4ZTFDSTFRVDJhcFZEbCtISnY3ek92RGwrVmVUZzYyYXRiK1NSSkda?=
 =?utf-8?B?djhYU2ZTZlk4L0NnWFNodHMyd1ZFeDQ2NlA0SUxQOUt3VkZ3NjdVc3dvRFRy?=
 =?utf-8?B?MnpWTEZIYk5LT0tBTnVTeDREd2RqSnlXWWZZRXlPOVg3RXpTR2tzTGtEbWhV?=
 =?utf-8?B?Q2ZlMklodURBSzBlTlpqc3AxdlhGSTZCZ2FmNVFMSlE1bXg5MUtEV0ZocXF1?=
 =?utf-8?B?cUlaMFVWaEk1Q3RYdzNWNldqRkJ5ZHdRS2lKUzlwd29uWSsvbUZiaWg4ZWRk?=
 =?utf-8?B?SUd0ZC9aUUtUb2t0WFJxd3pkb2dJOVZVYkZnNyt0UXc1VitGNTRWTUFzT3Zz?=
 =?utf-8?B?WXY0bmdVaGcxSFdrbUt0bzREazRoNFFad0lFWFUyd0RUUWhQRTNNMllCTk1o?=
 =?utf-8?B?MUI0Tkd0TzM4eTRBNEo2TmdwdnJxclFLbjNidVNkRkRGVGRlS2NlYTh5dm51?=
 =?utf-8?B?QWRPRVVCMVNabGNGTXBzK0xlN2NHbEpMOGhpWkhKanRsNGFVeTBZQXNWd09n?=
 =?utf-8?B?eWNIYVIzK3o3RG9vekk1cVhiVzBJY2FxTk1sMHNmVzBOcWNocm1SenIwK05w?=
 =?utf-8?B?dWZoOWcxT1dwODNGUDVvblN4RVYvdmxhMGdFQnNaYVhJbmsrdzNVM3p0dGRK?=
 =?utf-8?B?Q0hqaGQ3TWt3UE40NEZ1TDRNQWhDS3Z2YU45MDNKUWhycXUvSW8yY2NNZUhX?=
 =?utf-8?B?VlE4L3ZCN0dhYSt3REhGMU1lVSt6Rkxyckg4cGtFNGc2L2dMVzJZWE5CeHY3?=
 =?utf-8?B?clBxb2JjUEtFZHdUcWcramRxd1VTYjFBUDA4WDBXMUZFWkdTbWJkWlcrZXpx?=
 =?utf-8?B?UEF2ZHpkZ3ljTlJ0aitTUkpUTjdmTU9XRUt2SWVEekRDL3lvMnBIbCtpWC9u?=
 =?utf-8?B?QXVybkgxSGF5N2VFV2tLUm85NUh2RGNLVUlMMHkwcnZKOXJLSmQ1UWxRaFZs?=
 =?utf-8?B?U0N5MUdyUGdSOGcvdzZHUjVNM2RvdEwwZFpGcFdzU3drVnJuQVBtUzZxNVNM?=
 =?utf-8?B?UFhiTjF4ZktML3dGNVU2RmRSd0dsOVNXZDA3NTVUWVMzOWV0Y0VLSktVRzNB?=
 =?utf-8?B?dzhqemVVb24zQjh6VlZDd0lwQms4UFU1bVA4OHBRaVZkaHNQRFNEZkdBT0d4?=
 =?utf-8?B?R0M5VTVPVUpYdW81aFQ4T2xqNWN5eU00QmJudWpZOHM2aFVTRWNWTHh0aC9Q?=
 =?utf-8?B?ZEk0bEk2aCt3NktsNWZUV2g3YXRWbDJxcGQ0czhpc1lMT2VlNnhvdjFzNWhB?=
 =?utf-8?B?VWdFUDRDaVYwT0hxdmtYUGZMWGowUnBndGpnR0NDUGhWUDdZRFhQY3hHdnBl?=
 =?utf-8?B?UlM3TE1XS2tLN1padWtSV0Z2WVdzdTljRUQyUmYzQ24zdCtmSmJTK1FzWXk4?=
 =?utf-8?B?cnlMd3R0ZkxSRVZ0c3dpcmV2R2xYNm14eDJFR1Y3ZE1YZlFGSmk3ZzJHaUpS?=
 =?utf-8?B?dzBURWNGSElYOWwwZmU5eXJaR0pqUnk1SWFSNHlTUGtCQ3BrZ25GZmRFOWdH?=
 =?utf-8?B?RnlNQTRFUHBjbEw4SU5jbWxmNWtOeXVGN2dTdVJKUnUwc0lnUzM0ZndlVkpK?=
 =?utf-8?B?b09PTnE5QjBwNWhqeGFrMUxhalFjU2dJUFFlZFpxTTZIZSsvVHd3L1BBbXNM?=
 =?utf-8?B?b081SURvQ0xRdzVzdnBHT0srOFh4Y3ZXcDZPSng0RE5obVgzRXo3VDQ5Qkxj?=
 =?utf-8?B?N2s3bVpDUi90U281QmYzdVhDc2k2dWxOcnJqbHpZWm5TRjVUaW5sU01vZ1BF?=
 =?utf-8?B?SDRmSnZHMHRMQ0VtLzN5VHZmUGpvZVNqNjhqbVFqbmRLSXpVMWRkK2gyQlMv?=
 =?utf-8?B?M3lIejkzdGZOK3R6RUdXMWNXVFZBMFYrd2UzSHR6cGVSRXN3NnhpNzZyUjBJ?=
 =?utf-8?B?djJrenMzQWZjRkRLM0pGemVYenlFWmxqdEhnTk5rV3p2RC9MWkZnbnJGallF?=
 =?utf-8?B?bmlrM0djblVsYUQ4QjZvNGNyZEFUNkJqcUEvUm9NMnNSZGdIYy9wenFZUTBa?=
 =?utf-8?Q?k8Ty2yvc/u8MV7hcKZcgCNdaA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OER1UTVhNGl2ZkE1b2hkVExQNW9uSVBPREhrdkpJSFl5SlpDMmh6SWVzN0dN?=
 =?utf-8?B?Rm53ZzRWTE0xSHhpZVY0QnNERFZwZFhuUWZma2tIV05PZDBIY3l2VjFya0JH?=
 =?utf-8?B?REdwUE5ScFJBMlJOTDRkYjNwSXUrdlFGZERpR0MyZWN6aHB5YzF1ZXBWYjlH?=
 =?utf-8?B?R053QWJPMG5rMnZvQ2VZdWtIWlNKaUppQ21WdTIwZS84MDQ0TlVQNEdKZm9J?=
 =?utf-8?B?TXQvYUdpT1N0L3c2QUdLTlVhaC9zSFdLdThFSEUreVRwNCtZdG5IQnowczhx?=
 =?utf-8?B?NGlBK1VTb3o2dHNUQlRndy9zQThvTkxtU3ZvSUk4RzFvb1dUcjgwUndkRHdh?=
 =?utf-8?B?M0FFTUpidHpRUDVYMlJEL0tXOFI4dnpNbWYwUFBNVTE0d25kZnMxL0Y0ckVN?=
 =?utf-8?B?NVJYUnpjRGRMS2JQeXhtWjg4RmVpa0NMSWlTVUo3ZnBaSWIyd1poV0Nrc0do?=
 =?utf-8?B?c0N1a2k1QjBLMkVpYU1FRjFKN09uOEg2NWRxUUZlcWt2MnB5RUlWeDVLUDRj?=
 =?utf-8?B?UDRGMjJZOTRJUWZVeUgxbld6NXBQdmp0b01UeWVOdXpGUHlicWlZZExrOVJL?=
 =?utf-8?B?K3pNRWxUSTZhSDVlb0JRVG9ZNE13NXA2UFplWElkcmNaQkpWbXBET2Roci9N?=
 =?utf-8?B?SU5WOGN2UVdML0JNNnpMVkVFRFRFNW9JVmp4b2Q5K1I3cGJSdjRBWmJTdkt3?=
 =?utf-8?B?TjhkNkNMTkZCTEtkSUZzZFFIYXlnbG5aV3lQNzBJVjJFVXE4T0VvY2Q4Qytm?=
 =?utf-8?B?TThyWWhKQ2ZQU1hmWndRN3pUK2t4aXFtZjRFWnpaSzhYRHZySnN1RENTZGFm?=
 =?utf-8?B?ZTdDY2tYSzhCVEdwSnUwNk5XRUJyNUZhOWFLUUpveU4zWHBmWTNNL1g1QTJB?=
 =?utf-8?B?L2sybExQaXI0NlR2QWJyWHdQejdYdlhaeVgxRzhGL1JUUFlERHNuNVVTaERV?=
 =?utf-8?B?M3AxdHhmRFNLZFozVWdtUkhNRVFka1U2bDNoQ2dUdFpEV1l3NGdHVjVDdXZC?=
 =?utf-8?B?R1FlRFYxQkpMSEYvZzlMZ2hPME55QkxxdFNCcW5oV3V4T1hiUlZrL0pVZ2lw?=
 =?utf-8?B?aHRLNE9CNFpVcnFTdGRlamNZcFJhb2labHg1WW9HeHlOVVRndVdrUk9ZNnh4?=
 =?utf-8?B?MWFzT2pWNWdxKzdiSGYzS091R2xrR1JIVFJCWUc0N2Z4bjg1c3RaRU1Nalln?=
 =?utf-8?B?NC9uRSswOVNrODVxRFR4aGhlUnJESVRKMWpTK09VeGQvN2g1Tk9QZWZNRU1O?=
 =?utf-8?B?MTQyeFlXMEZWSUJ3TjE2aSsrOHgzcXlsNXg2RGlSU2I5RG1DeVZtT2lxUUZD?=
 =?utf-8?B?Y1lsV2FlTnFqOTgrUlRKOXE1YzNBNlAxK3BUTDQxSWdyQy9RVUxhTCtJVjVJ?=
 =?utf-8?B?Rm80N2JhYXRNK0FqVmFBblhFQ1JNMzU1aVRDUk43eGE4NFBqUTBFY1JFUStR?=
 =?utf-8?B?ZHZsa1diUzN1TmhyOUFXOUdyeEpxNWdzWjk3Q2JUdVBZYU5OMUtpd2ttQ3JL?=
 =?utf-8?B?Y1dpZG1ZZVhUbUdXclRFNnZrK00vbkhsSytLY1U1cHVzcUhPMUdoR3NSQzZy?=
 =?utf-8?B?NjZKQm4rTUhtZGZtK2R1OEZSaWNERjIvQzNEc3RSYzJ3OGxncjlsY1lRVEs1?=
 =?utf-8?B?TDBSSnNQTG5vS0d3aHhxSXUzcTliZkN0WTVDYmRmQVRRQ0duQ0prMm1WVXVv?=
 =?utf-8?B?VU1oWXdvb2pVdllmZXN5a3lIOUkvMW5CbTg4UEtoN1g2bjZSczlQRzVwU1p3?=
 =?utf-8?B?TDBLWk5tTSt5enRDSWlUMTFHTGxEOG5lRTFvTTZ1N1JJUG4yeGpFSHVNQkh4?=
 =?utf-8?B?QlBaenlYM1EzS2kzQllMQnVyVHE0cjA5RzMvYUN5OEw3aWc3UWdzTldvb3hE?=
 =?utf-8?B?VnJlRXFDdm9MS3hNbXJ1SFhra1psclNwbWJjY2RpVXRuU0ZyUG1yQ1hkdFBO?=
 =?utf-8?B?YlQvYnVNSkdrazJ5aUIwU1dDOHR1cUF4UGYvd3RVZWIvY2hMUk04U0o3aHJy?=
 =?utf-8?B?eWV3ZWVzb1MyaExnNDRWR2lUWFF2Q0dpRkVBU1pkNGtCV2JYRndkT2JnSWdL?=
 =?utf-8?B?Vm5vM3oxVGNHZDU5ME8vT0o2M0RoanNwaE5NQzJpRmpjWW5yenNwZVd6RDZ0?=
 =?utf-8?B?S01QVlh0MzJlclk4aFROY2JDQ1BKVjNqb0hVWS9JYlg0dGpxMGViZ3pHWUww?=
 =?utf-8?B?ZkRUVG9XTmZqUmVDNEg3NjNXT21QL2F5L3BiK3VHVHhsQXhEaEVCaDFPcDdZ?=
 =?utf-8?B?a2ZmWEtXM1ozaDlEQXpNeERRT3pJTTA1eTQzYmlMSjJyNFlJai8wUWl3K2hj?=
 =?utf-8?B?TGVnZkIzcjBJendEWG9wN2I5YkF4RERTNEM0WWxUZjZscXVUWjIzZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I9OjtOnb13NfxQ+/KGQ6fz/M8M0S7opKr2I8bKLLTfeg3sndvOIQS7GFsm8iAuzOiYAdt3Dwh1x0HKmKXW02IxcFcjLN/07Ehbu0GkusnYptGWIYOCuOle8+q8exk0ECVDd/jCgrLZvBH9v5tRlo/81EPDeZ9+rgS5Lk+BzpNuwPmeTCmibApMi57zaRxh5TzSZynP2P/nhSQOQja/an5yPRiPtrkeq2ceTS9Y1IM2l1IE8ZmL0ApRc1ZGaRFzsoMHD6McBWQOZdhF1zE91LTWCWCBuGKozBpa/KdAVludvSZfyHZeqIMnCnIrEKUwOdQeRFsNCaxzjObFiBEOGY1jNeLsSd3sbWUl7aUO16C/Di7uYGfSjKfeeROnSAUqjfqNXoDoz6tGX9uC9jp51i1q07ypPVYry3DAbU3vqLrkg+nIt+POXBEuUxGzVjHabbbHdO2QyieiSJ71jVX2kmk0xxhBFoOfAjJZ/zVWtGIZmZaWvc2xGFjO6zQTVbH5pAU35Wsc3/sQE7eXIPMwgqOTi52/GFTVccbc7w9LD7tbKGoTE83wahm7IGaH6JB6YFAAXDiPRtYIF2ZrQ0+dO17Eqv7tGzmXqe8KXwrJgy3SM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6c1036-bf98-4744-55be-08de6384e2b1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 00:32:32.5060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLvd23DaRaCpril0y1efocjiBrw8RzcKxyrzB362XUTGbn6aS3pZsI77D7mqFV6sHt7WmHT5XpTNDRU2X2I/CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997563
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602040001
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwMSBTYWx0ZWRfX/D6AV7L/gvhM
 5vyvHLmtQIUwFHxoKFYnnGBfyBaxehZE9NX6EJX+DlFwcTdv2molt/8fPPICCWL9E4eV77lcjFd
 m0bijFMPzg6oF34AnUsVcr9JxSnUfkmHIO3uSM8OVEzLKboUCs6OhFjoDmHaPz4qd7FdM6wGQ2K
 W+E+vlsdyorG5hw3u0enC2sRj3ZdKjriEY2BNpqibSOFHRpzZyxdGr/cOAdxvy24SRccWhVLMu/
 QbSxBdjNSMfqFYBU/oOXBUlf4J3QCW1nqQVhIDnsnTAtbak1YXyArBQm3GGmUtN21TvQERWtqEi
 O13aUO28QsG6oYW7FhoOpJoyM6q2tH0frZ8xnEaOS4wAt6xf8BXyDWYVvR64w5+dVgEXfJsCsMr
 gE5dUb70Mu+h6jc0YXF7fT3iuZygDRE1oE9InNafKsFD+xr2bQ3glGTwpeBG4qHlikSFr0346ZG
 rmaRAC6RomvxA1ZlItA==
X-Proofpoint-ORIG-GUID: 5V3-7ZT2EZjnkfb7vvNGU9Z-wSCo-ZOY
X-Proofpoint-GUID: 5V3-7ZT2EZjnkfb7vvNGU9Z-wSCo-ZOY
X-Authority-Analysis: v=2.4 cv=CaYFJbrl c=1 sm=1 tr=0 ts=698293a4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=YrYpvIkdn5GeyFh80eUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

fwiw, test problem seems to be OL9 and OL10, x86.  Not OL8.  Not 
aarch64.  (Well, one aarch64 VM didn't start up, but there seems to be a 
pattern.)

On 2/3/26 18:53, Eugene Loh wrote:
> s/arguument/argument/ in subject line.
>
> The commit message should include "Orabug:".
>
> Since this is right up against a release, should this patch update the 
> changelog and NEWS?  Or, a separate patch?
>
> The tests define CC, but I thought we were getting away from that with 
> commit aa63660a7cfc ("test: allow overriding CC, OBJCOPY, OBJDUMP, NM, 
> ...").  And, yes, there has been some slippage in that department.
>
> Typically, CFLAGS picks up $test_cppflags.  I didn't bother to check 
> if we want that here.
>
> Not a big deal, but test/unittest/usdt/tst.multiloc.sh has an 
> unnecessary blank line in the D script.
>
> I quickly tried the test on one system (fwiw OL9 5.15 x86).  I didn't 
> bother to investigate, but I got:
>
> test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh: Running timeout 
> --signal=TERM 41 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh 
> /home/euloh/z20240321-systemwide-usdt/zdir-src20240611/dtrace-user/build/dtrace
> FAIL: expected results differ.
>
> -- @@stderr --
> dtrace: error in dt_clause_0 for probe ID 5067 
> (test_prov2322957:test:main:args): invalid address (0x402010) at BPF 
> pc 252
> dtrace: error in dt_clause_0 for probe ID 5067 
> (test_prov2322957:test:main:args): invalid address (0x402010) at BPF 
> pc 252
> Diff against expected:
> --- test/unittest/usdt/tst.stapsdt-notes-bug38922360.r  2026-02-03 
> 15:07:41.656410179 -0800
> +++ /tmp/runtest.18439/test.out 2026-02-03 15:41:13.250649966 -0800
> @@ -1,3 +1,4 @@
> -test:main:args main
> -test:main:args main
>
> +-- @@stderr --
> +dtrace: error in dt_clause_0 for probe ID 5067 
> (test_prov2322957:test:main:args): invalid address ({ptr}) at BPF pc NNN
> +dtrace: error in dt_clause_0 for probe ID 5067 
> (test_prov2322957:test:main:args): invalid address ({ptr}) at BPF pc NNN
>
> On 2/3/26 17:31, Kris Van Hees wrote:
>> When a USDT probe has multiple call sites in the same function, only one
>> of the probe programs retrieves the argument values correctly. The
>> probe argument data is collected for the first underlying probe, and 
>> then
>> skipped for any subsequent underlying probes.
>>
>> Since it is not guaranteed that the argument description is identical 
>> for
>> all underlying probes (although it is almost always that way), we 
>> need to
>> process the argument description string for each underlying probe.
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   libdtrace/dt_pid.c                            |  9 ++-
>>   libdtrace/dt_prov_uprobe.c                    | 10 +--
>>   test/unittest/usdt/tst.multiloc.r             |  3 +
>>   test/unittest/usdt/tst.multiloc.sh            | 67 +++++++++++++++++++
>>   .../usdt/tst.stapsdt-notes-bug38922360.r      |  3 +
>>   .../usdt/tst.stapsdt-notes-bug38922360.sh     | 52 ++++++++++++++
>>   6 files changed, 134 insertions(+), 10 deletions(-)
>>   create mode 100644 test/unittest/usdt/tst.multiloc.r
>>   create mode 100755 test/unittest/usdt/tst.multiloc.sh
>>   create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>>   create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>>
>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>> index 6f93123f..a379a0fe 100644
>> --- a/libdtrace/dt_pid.c
>> +++ b/libdtrace/dt_pid.c
>> @@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t 
>> *dpr, dtrace_probedesc_t *pdp,
>>           if (strcmp(pdp->prb, "*") != 0 &&
>>               (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
>>               continue;
>> -        if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
>> +        if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
>> +            char    *p;
>> +
>>               psp.pps_sargv = prb + strlen(prb) + 1;
>>   +            for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
>> +                 p++)
>> +                psp.pps_nargc++;
>> +        }
>> +
>>           psp.pps_type = DTPPT_STAPSDT;
>>           psp.pps_prv = prvname;
>>           psp.pps_mod = mod;
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index 6d1c0f65..e575b072 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, 
>> const dt_probe_t *prp,
>>       if (!upp || upp->sargv == NULL)
>>           goto done;
>>   -    /* First count the arguments. */
>> -    for (p = upp->sargv; p != NULL; argc++) {
>> -        p = strchr(p, '@');
>> -        if (p++ == NULL)
>> -            break;
>> -    }
>> -
>> -    /* Record number of arguments, and allocate descriptors. */
>> -    upp->sargc = argc;
>> +    argc = upp->sargc;
>>       if (argc == 0)
>>           goto done;
>>   diff --git a/test/unittest/usdt/tst.multiloc.r 
>> b/test/unittest/usdt/tst.multiloc.r
>> new file mode 100644
>> index 00000000..06b0c94d
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.multiloc.r
>> @@ -0,0 +1,3 @@
>> +test:main:args main
>> +test:main:args main
>> +
>> diff --git a/test/unittest/usdt/tst.multiloc.sh 
>> b/test/unittest/usdt/tst.multiloc.sh
>> new file mode 100755
>> index 00000000..aa8ea2e5
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.multiloc.sh
>> @@ -0,0 +1,67 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights 
>> reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +
>> +# This test covers USDT probes firing from multiple locations in the 
>> same
>> +# function, verifying that argument data is correct.
>> +
>> +if [ $# != 1 ]; then
>> +    echo expected one argument: '<'dtrace-path'>'
>> +    exit 2
>> +fi
>> +
>> +dtrace=$1
>> +CC=/usr/bin/gcc
>> +CFLAGS="-I${PWD}/test/unittest/usdt"
>> +
>> +DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +cat > test.c <<EOF
>> +#include <sys/sdt.h>
>> +
>> +int
>> +main(int argc, char **argv)
>> +{
>> +    DTRACE_PROBE1(test_prov, args, __func__);
>> +    DTRACE_PROBE1(test_prov, args, __func__);
>> +}
>> +EOF
>> +
>> +cat > prov.d <<EOF
>> +provider test_prov {
>> +    probe args(char *);
>> +};
>> +EOF
>> +
>> +${CC} ${CFLAGS} -c test.c
>> +if [ $? -ne 0 ]; then
>> +    echo "failed to compile test.c" >& 2
>> +    exit 1
>> +fi
>> +$dtrace $dt_flags -G -s prov.d test.o
>> +if [ $? -ne 0 ]; then
>> +    echo "failed to create DOF" >& 2
>> +    exit 1
>> +fi
>> +${CC} ${LDFLAGS} -o test test.o prov.o
>> +if [ $? -ne 0 ]; then
>> +    echo "failed to link final executable" >& 2
>> +    exit 1
>> +fi
>> +
>> +$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
>> +test_prov\$target:::args
>> +{
>> +    printf("%s:%s:%s %s\n", probemod, probefunc, probename,
>> +           copyinstr(arg0));
>> +}
>> +
>> +EOF
>> +status=$?
>> +
>> +exit $status
>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r 
>> b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>> new file mode 100644
>> index 00000000..06b0c94d
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>> @@ -0,0 +1,3 @@
>> +test:main:args main
>> +test:main:args main
>> +
>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh 
>> b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>> new file mode 100755
>> index 00000000..4678a415
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>> @@ -0,0 +1,52 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights 
>> reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +
>> +# This test covers stapsdt probes fired by the STAP_PROBEn macros, 
>> verifying
>> +# that argument data is processed correctly when the same probe is 
>> used in
>> +# multiple locations.
>> +
>> +if [ $# != 1 ]; then
>> +    echo expected one argument: '<'dtrace-path'>'
>> +    exit 2
>> +fi
>> +
>> +dtrace=$1
>> +CC=/usr/bin/gcc
>> +CFLAGS="-I${PWD}/test/unittest/usdt"
>> +
>> +DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +cat > test.c <<EOF
>> +#include <sdt_notes.h>
>> +
>> +int
>> +main(int argc, char **argv)
>> +{
>> +    STAP_PROBE1(test_prov, args, __func__);
>> +    STAP_PROBE1(test_prov, args, __func__);
>> +}
>> +EOF
>> +
>> +${CC} ${CFLAGS} -o test test.c
>> +if [ $? -ne 0 ]; then
>> +    echo "failed to compile test.c" >& 2
>> +    exit 1
>> +fi
>> +
>> +$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
>> +test_prov\$target:::args
>> +{
>> +    printf("%s:%s:%s %s\n", probemod, probefunc, probename,
>> +           copyinstr(arg0));
>> +}
>> +
>> +EOF
>> +status=$?
>> +
>> +exit $status
