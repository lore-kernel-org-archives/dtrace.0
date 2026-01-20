Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6896428498
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925960; cv=fail; b=Dxj/kPI9aJCaNX5p1OKg+CneoWaB0vVY2Kto1Nra5+Zfozryia8tfY8DdoANzm9kffCZddAtVPF4Pa7y9ZjqU7HaU0Ij6RaUw2OSd6hlM4jYoNfIqRs0T42alhm2PHE1doIXw4xUrMPGXdwXXpk9hJg2tTxA/iGg7tGdQ+AKnfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925960; c=relaxed/simple;
	bh=nyB7fAB3xb1Ul5VOxlDR9DC60GzaIP4JTzyR+esy7Yw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=E0lsu5o+6wpFfcz7PjVYkdzpu+umSH/F6xa+2uH0QnxP4wkc/LTv3b0iugliCzjOnvDujFcxY7cWe8qjqU21HAYYFB8GPjGF+mm0tFMi1IHuXnfVxHmOSq04MxlB9k2dL7lzG7XoLNuV/EkN0ynFMiZti412LZ6y1McoNA86WMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xui7AXew; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FiP5xEBy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xui7AXew";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FiP5xEBy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KDK2af3867747
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nyB7fAB3xb1Ul5VOxlDR9DC60GzaIP4JTzyR+esy7Yw=; b=
	Xui7AXewUi7FKAVjj5bR9xpsPq5x3T3OSzlcN+Z2kqYkuoV+sXA8SikDsnteWKvj
	Y5S4p8RFgRaw3f0csR7kCX7FyZYVXFb92zB3+XAZeV8WYu3ftRplf2zNTB9sH8DN
	VPxNI1wcocyy4+OOcO9Y7Q5ZJHjWA2nl9ggZp48bQfu9QuP2CMC6jNdcvhg7I0op
	eC9/LHr5EDhVcZkbEMIQhDHA+nhfspyF37yJ/9++DV3hPNlQrpS4jlB6OL0A7GZI
	RGeNj87qoRLRYFJWbd7loankYMm4ZyQGi9I8PkJ8UKQmrpC0Dd/6Oag/sDvEia6S
	qG0W0pFz2xbE/Q+bNSlLdA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4btagd0arn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:19:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60KF2E9m039561
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:19:14 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0v9v9jp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVe3/RVJo19KP6/O5akCNoF74YXsoU90UOgDpSqCnle2RydZI10vLDff+a2zLSP6zzlcxhXau5OKxrRIGS5jeiC7FwQBgbs6bYkNr3TQuSjHTMbU+1GDS3rM+MJ3eVyWLg6ypThh+qNNk7Lwa2ZQ8zG562r0CEvBrDBdImpVcZ4kuMhUX0w2uxNXDwoWqB+Rvs18OmSi4IYLWTOmHqyJy9504mhAobuPBxc666ha3bpdqlvb06f4YnP+TpRK0THE8dJtCG5RYlr0ReZ6SnpYY2CiS83Fz3mZvl8/4h/ODEzxgOwhlAOH0x5OIUdVO1OH2cnD5nSqe3JIj2C05IpIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyB7fAB3xb1Ul5VOxlDR9DC60GzaIP4JTzyR+esy7Yw=;
 b=PTCy6JsgQsVX80fdqcy7RNMibyY1ysTg3dfcxm+GVRdpqvLzDNnuJyVVK0KFnKZrLWfqhgjkM+P52Z0rEC+ph5ZlVoHCc1sJcj6m8rcKvo9hFwke+UOkqmnM8pOwo8ZfTP6LayW/cXX8DxLzvcNJNJUPp3J3HLldo0G8GZWrUW4P7jCtFUVih6us7ETd4Cvxh0cD8WMoPsKV9DoqRy1T6u4Jv9H+I+zT6ys+UjY1WoFXFaVJ3M7Bnc1LTlcgBjChgB8RXiymZp4KO8DcYetqQmSTQLCByXDxr7zr2ExLih3CJg33Yp5QqgFuofhncn5ZRJmhumgWXuhDUQJk2FSokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyB7fAB3xb1Ul5VOxlDR9DC60GzaIP4JTzyR+esy7Yw=;
 b=FiP5xEByd++NK+KxvVwFiWVv9Nu44JowMj6mvHKU8dYzvj3DzjodhAgN2wcXQyylPDEkrftwoPcY0NsMGHOlzBvPdbcNTSIwvZp4/f+XxJI+nKBd64N2UBYZT6cyWX/IiZkd+eLusEt07EB8t0F7RvzvcidosbcmYQzyZWoxRvs=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by MW4PR10MB6300.namprd10.prod.outlook.com
 (2603:10b6:303:1ee::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 20 Jan
 2026 16:19:10 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:19:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: <dtrace-devel@oss.oracle.com>, <dtrace@lists.linux.dev>
Subject: Re: [PATCH] dtprobed: use /proc/$pid/map_files, not the filename of
 the mapping
References: <20251202230453.124306-1-nick.alcock@oracle.com>
	<5800da63-825b-1f6b-2f79-06fda2e6f658@oracle.com>
Emacs: the prosecution rests its case.
Date: Tue, 20 Jan 2026 16:19:06 +0000
In-Reply-To: <5800da63-825b-1f6b-2f79-06fda2e6f658@oracle.com> (Eugene Loh's
	message of "Thu, 4 Dec 2025 01:18:43 -0500")
Message-ID: <87v7gwb6kl.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::12) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|MW4PR10MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: d253369d-8d31-4279-1a87-08de583fa4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aElIVHpNd1lFdHJnWGRid3YzanRRL3ZhREpHdmg1N0dtQldDZEhRTUJGcTFZ?=
 =?utf-8?B?S1hXaFViMGhYckZyYVkvSFM0dU16dzFjY1pqN0wvcnhiTnJzWFg1Q0ZzdGxm?=
 =?utf-8?B?eHpCd0Nlcjl1M3E2UGMrdHJiRVN2UGdrL2YwNlU0RUFGeTRSS2dRMDU4V3kr?=
 =?utf-8?B?ZWNoeWdiZkpNTlBiNGNaNVd2WkU4RzhJREVIckRYeGlzYnpsVHJxOUN0ZVZL?=
 =?utf-8?B?QlpZT294TzRKNWtxek93M3FzWjhyUm1lZm9HazdBZmRqWjFDRHBpV0dSQUNx?=
 =?utf-8?B?c0NpQXUvalNRMCtEdk9vbERTc1pGL3JrNUxnb2FWWTJKUjQxNDFkSXJ0ZW8z?=
 =?utf-8?B?OStEdGt1S0J2SzZxK2g5K09MNG5rbVBsZXN6bGhLVDhFQnR6M3hiNjg4NzNp?=
 =?utf-8?B?QWpNTU5NUTY5dmdlTlFDR3djcHcxT1NmSkovcnRNMDgwTDcwYTV0TW4ySUNr?=
 =?utf-8?B?MHlzNzBocFhvTXVjMkVkZFpMZ1N5dXd2YUkwbWNNSFJSM2RpZ0JYUFdVK3E1?=
 =?utf-8?B?TjNBOU52NjlrK0w3R3F4Q1BWNXMvTWdBQ0RadTh5SCtmaUlFS1ZMVjNuSkVB?=
 =?utf-8?B?RStSaG4xVjZQS00wSlB1ckF1SXFodGthMmVqclYxNlFXZnZwRDFON1F3MEdF?=
 =?utf-8?B?N2U1L2JKN2JvblFPdXNjMW9vUUJPUUtkbmc4M0IrNVZ1aFZCdXBrMU9QaU83?=
 =?utf-8?B?T2xhTWU4RGh1ZVhxbEN0YzRWTFluRGJrQk9CMjM2T2U5VU1QWFJlSVBZcUVF?=
 =?utf-8?B?ajYwaGlUWlg0MzZaMmlrYU1HS2t1dnM4Z0ZmZEtlRzE2azFtdXZvQ2FOMG9k?=
 =?utf-8?B?Yzc1aGhuZlBzSGhySGJNUFNESmd6NWh1NlI2bzRmcUFWMDlBZDFOVFBIOUNj?=
 =?utf-8?B?WnBYdWNibVlNc1UyTkpLU0NzMlU0amFKL2JhcUtMYTJ5cHRrMlZNTDZYd2xR?=
 =?utf-8?B?dm5mVTBwTDJ0U3BJd3RoeHRVN2dML2dGSXU1V0grblFyVDRvbkNXZjArMGtF?=
 =?utf-8?B?OURlL3A0d09OR1BEOSthOGwrU2JRQlp5WWlVMzBQRVdQdVNXWVZxT2VPcTZD?=
 =?utf-8?B?N3B2bHdEd0hMK1IxN3NKdlJCa1ZrbXFxdzRaQkdwSFVNSWpheStmcGpjNG81?=
 =?utf-8?B?cEhkaUt5d21aWkN2RUVPYUU4Z3R4ZG1NTUdZL3FjeE5CdjQ2SFl2MFFpMzFO?=
 =?utf-8?B?U3l3dktrOFlxM1ptT3BpQU4wMEFXR3BhazlZRDdHdngxV2Y1QzhJTTJ0ZWZB?=
 =?utf-8?B?SkI3dktSY1VGVmhrN1pITVNaTUh3Z1B5dWhMbzg2bFBEMElNR2E4OU83bWtP?=
 =?utf-8?B?L3RFcHRHcWZRUkh6TG9BT0tjNXVkOGRUMmFlUndsZlR4Wk5kWmNUK1RNaEd5?=
 =?utf-8?B?UnZtNGkyemNsY0FIWFdoRjFRYkZPQTVaNUZRNklUc0lpNTk5N2ZCYlp6akdl?=
 =?utf-8?B?SVBuay9uMTFaNVlFTmJCTkVqeGFMUU52YVJNbnJmajJqbDN2THdNRDFtMlhU?=
 =?utf-8?B?VWlreGUvazBwMTdCS24ycnJLejhVUGlJMWNVYXptSk1obDgrajI1Q1k2cUV1?=
 =?utf-8?B?aGdFVFErMU1DNkNJQ1J2NEhsY1hQNFZkOWJwUzVVODI4NHFJSWdFcjZtMGdx?=
 =?utf-8?B?bGZjSmRrZFR5S2RiUXU5bFpjN3FRQ2h1R0E1NU9VYnFnYUV3OE0zMWh6QTB5?=
 =?utf-8?B?UVJWbHM0YXp4S1pLY2oxWitJaWprSU1IeEJMRkhSdGpTMVZDanMwRHJpTy9H?=
 =?utf-8?B?QUQyWStpZmFnK3AraGc2MXZRSTNzbkM4WitSQzdsV0lwRVJOSTdTQUxUN3Vi?=
 =?utf-8?B?U05hdlY5dExXK0ErUSsyRkZVUG1yelpKNnNwSE5pa3lZN2pKOXZuUnBaVVZJ?=
 =?utf-8?B?WGNWZkpKSEpXVE4va3Z1a2xZd1lIYjNuM0pLa2RqSVd5ZnluTk9CVndkUkZR?=
 =?utf-8?B?bHgxaVZNRnVHTVh4UjcxS3BFT09xQkJFOVhOa1o0Y1VvNlRieFdHV2N6bXpX?=
 =?utf-8?B?ZnZwV1ZxWU5TcXdYbmEybUJXenZpVy9XQWFrekVqaFU1bkJUQjR2aW9tRjRs?=
 =?utf-8?B?RVBtWDE2QnV2aXd1WmtDMXM5Q2QwNVVRRWFlMWwvS01xR0hFbjZaamRVWU1r?=
 =?utf-8?Q?wCDU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVZ3MXpwdjRmMnhzR00xMTd4YjhSZENMN1FzN01Qc2l6S2VDdk5DRXVFSFha?=
 =?utf-8?B?aVppSU43WUtUWnF1L1N2ZjhhMlJydDFzTXRuR1BoQnhWNUQ0ekgzaEZsWWwv?=
 =?utf-8?B?T3ArWTZTUHc1TmljS1A1WjFWTHZjcjNCYld1VGxxOTJZWWFiV2RyYlpEb1oz?=
 =?utf-8?B?WmVPRTIxTXhtRmJ5Zlp5VDdIb1NwY0tsTGRTZnhLV0prY1lVSTl1dkhyd2ZT?=
 =?utf-8?B?MWxuc3cyd0dTNXgwVXg3aHhDd09TL3ZrS09HSXhhL1NBZHlEK1FycHdLY01J?=
 =?utf-8?B?TVh5STROWDI3N3dPU3pqdDNLamJxTnlDSlJIbFRPRm9oOUpvYWJrUTdDV2tD?=
 =?utf-8?B?TkJ3NXk4OFZsMkQyZENlYTRJZXRxeXRXNnU2N2srM2lZRFBIU2RoREFwY1Zi?=
 =?utf-8?B?b29Vb2hORVpwdkd1Tm9id28yWXpKSThnNEJ5d0p0cThJN1RBZER2ZDFHTlVr?=
 =?utf-8?B?Mnh2U2tMRytIcUtiVmg5RnBDbHR3cjFLQ0pha3ZyRHZvSTZ4MXZCT1JlbUNH?=
 =?utf-8?B?RTc3STIrOUtBcUcxVW5RMDhjWEVWaVhwRzl3T1hqbFlNWTQ2VXZPdEVianhE?=
 =?utf-8?B?aFJCais0TElld2hlajJJQlIxSGprRnZIMUhFQlpiaEo4emVNOTZweHc4RWFJ?=
 =?utf-8?B?YVNmYlpMcDdIYVQ1K2NOVVhWQVpESWFIaCtsTjQvdGhvSG9qajAwRndUSzc3?=
 =?utf-8?B?SHdRK1lYeUtGMW15ZEpoSGpGa1RQSWZmOVdUcEYxc1I4cDRWRXlkcno5Yjkr?=
 =?utf-8?B?RXltbEJmbzNrOUNoNmxIQldqYkhkREdGYUFkeVdRRkJGaEtwWHFTWWVuSU1r?=
 =?utf-8?B?QmxSUVkza3VzTy9FM3cveXVQdm5TZFFCZGxaN0tjSHRNalJLSWx3QTRWdlhV?=
 =?utf-8?B?NXNVNFJGQ3ZCT1FpMkF3R2hveW8zTGRBWWpLS2p5MG5JYW9SUHp6SjZiR0dG?=
 =?utf-8?B?bms1bFNoQmliaXJkdjVCSHMzRFJzYy9ORVBCeUtvZmpMdWhqK2xRWktSTXFU?=
 =?utf-8?B?ZFNUek00QW5hNzJ3MlBiZDBnRE45M1o4Z1hGUjM3M09EVDlrMStPcHF2TlE0?=
 =?utf-8?B?VE45S0o2eEc4RzFDUW1veXM0cmtxUmdZRm5RQ0pVT3Y5L2NMb2Zwc0xoUy9C?=
 =?utf-8?B?ZXQzZGRFWWNBeG1zb3Vlc05QVG5CNHlLM0hSMGR6M25CL2dwMklibDlpS0Z6?=
 =?utf-8?B?akRrRDg5YWJta1RBbjlQZ3NvQ01ialdXWCt0dC9Sc05YWlVGNUMyV1hBZHdq?=
 =?utf-8?B?Qi8zUTF6dmtwVE5JczlUNEZLS2l6N0Z2Mk5kTThGNUM3d0x5Mjl0T3dsZ3FR?=
 =?utf-8?B?cG9qR1BRUGRLSzZmMFYvazk5VTRHZW9lY2JuOUc3Qzd2QURhNXV4M084eW1W?=
 =?utf-8?B?b2VTTEtkRW0zK2ptdHZVcGJaTGR5QVNZbHY5YkZhMjFTN3JEejVPRHp1aEpp?=
 =?utf-8?B?SWczRzlvUEU2dlpjbUtlb0d3SFpoNVZldVdDaUo4dVFGZVhoVDY3UVVOWjNj?=
 =?utf-8?B?Y2FoczJBYjkzdVJqWWxMeE1NZXc2RUxtckZEMU9xdTdUSDc3T25sUXE0Rk4v?=
 =?utf-8?B?alo5aHk1Nk9hUmJEbUJ5RHdwMFV5S0NFdmtDU0REZUs3TEtHSWY0eGZFMEsy?=
 =?utf-8?B?anZVeDJ5SHFkblNmWG1uVGwrNEk0ZkZ3aUhnVlpBUkVIakN2NmljNmNzQVE2?=
 =?utf-8?B?WmdqOHAxRHlXN1N3YmoxTGhLbllSS1ozcE1HUDVkNElsT0RRVHhlREIrUm9G?=
 =?utf-8?B?R0dDVnQzSlJBTjJCMHdUYWRqMXZ0NkR2ekQ4SE1CVjhHcTZPSHBTWnFtV3Rm?=
 =?utf-8?B?R2JNZk5pcmMzV2ZJWTVUTXp6SnBjWnU3bHB3YmMxVzg0NGRNY1ppUGQ5SkVs?=
 =?utf-8?B?UzNRUnlOSlhma04zcmpsd3BIMWRFZk5kcGFYRE5oQVphZEJ4Vm9SK0RjdU4z?=
 =?utf-8?B?NFBXK2E4L0xsMk5GNTFWTmFhVThxWmdHUm5RNnBIWk9sbGFIS3o1UGpxZ0Fv?=
 =?utf-8?B?TUg2em1mc0pyaGc0c0RqVWJiK1RFVFJ6NGtaWGcrMkRJMUtlVUo2MlUvMGl4?=
 =?utf-8?B?UldxNXNNWGZSZG9SZXIxZkozY3lTRE14RzFOSnBCYnl6NEpBcDRET3Z5VTNO?=
 =?utf-8?B?MU16OFZ2QnFXcGlzY3cwL1QrbEs4eXdQUnRwSVVZaC94RzBkU0dKMHBCUkt5?=
 =?utf-8?B?MnQ4U2hibmREV2xKSkdYTk9RTGlyVUl0R1I3K2RkeFJkbXhHTUJQMHBGOEdS?=
 =?utf-8?B?Q2JKR1A2cCs5VDVjQ0RKNk5tSi9vczJWd2pJSVR5NGIxeENCYlpvU3B3Q0k0?=
 =?utf-8?B?MUE0bGcveW15cGFOV3FiK2w0M0dLblFmMUxzejZJRnJQSEtnNG5FUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MTS2ADBTy9Zb4US93JDNSRtLejw1phNDPKFjSOEjlwRwXQNGvrRUU1KNnWdvkqZF7Rx7RK0Md9EGv7pJDDDE3b4qynZUZi7Z59I4rIgu2xefWn6Kvjv9YYHS4JL3vMtHJfd1Uv8sD4Qz2pdfdNAqZRxWl0aoduVA7gXmvGkU8HzWzML0I1qz0lK15D9t8LTr7MRR6ducLrHptUDmT/QcT46xomsHjKkXqg+h7/j5ZO0TEBvEU6ivx12sGcDksYLuXrKKvRWuS5RLAtP20SJp9+UpLiWN0PR7AY/MnVKW6avr4wA0H6Fzvc4f0PFYwvwCpW6Nf6QXyhDXsjCIZJatmCr3kYFDmvrdzV5IOix74cVwpU5X1wjGSTyl2EmEKL0SQsaYdRhArqhC4HC1QWrXjLkIiGN76t0m4tC8rF/7T+RxGRQ+Lb7EyO94mjbOAuDwRQPB5JkDnp02u7mnktkjvMMBGh+uKHQYhmZbYnLCrKC745kZ7aP8afjtZWn19uI3uZQQpoFHnHhQcrjb99uZGTYuxi9xV4wUVjhu5+MuamOoxSqooSpGssiK6aGmmAMyZCg/wYBsydllzSfpPmG9Bz4X49AB4sISFF2sp+i2zb4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d253369d-8d31-4279-1a87-08de583fa4a0
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:19:10.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fS5lsedlIbnzlr/U5kLhO0F3+thgUr9Y75VEIb/D3y8XRwNuliS6IDeq9d5RXH9LiGyomYH6o+03HNCVeinZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=802 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601200135
X-Authority-Analysis: v=2.4 cv=PqqergM3 c=1 sm=1 tr=0 ts=696fab03 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jMbnPfBed96yv8O5U7wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jjQL2jifFvNbUcTodZEgz5RxXLw3DCI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEzNSBTYWx0ZWRfXwFS/Ljxk6SAK
 /Sa38y/X1hkqJOdUYPz71StrF5bsRiWY8X07MWUO4CzFSEXxmoEI3LzbYBYi0yfUwDcUW4oAbHa
 DSToD+Mjwwdmuk0Di7C+8RUYNSH6WjiuBlRwqqt4OcVAsaKaUMpaDedf9LavVS9vWB6+A7ou5Zy
 TqfFMTfdADkvhea/jP3Fp1LDa/S6R/K6GQsn1+FtiyPnk20LRT1IbX5fnGh0+axg3gbsXq9Gwqq
 lXOkgWBwRcD3gKt20pI2sPYn2tBX56Fv5EsBeeGzUTg40SG+PhJffYm5Y0QV/Ucv5Zpvyxd0tmT
 9jGury46XkxxeaxurlRntwpE3fZO3HjepuDwJK46sdTx6L8QaMrUlPoyAF7qFeryLhSiFFQLPGQ
 RMoeF1aVYzoXIO8IwqKBsDiEdyiPR6TUu7S7cn4k6ttkbYdGxkSkndAooghvxYGTl/u+KYr07x1
 v1h+nCW+XbKCufZeZ3w==
X-Proofpoint-GUID: jjQL2jifFvNbUcTodZEgz5RxXLw3DCI6

On 4 Dec 2025, Eugene Loh told this:

> I tested on a variety of platforms, and yes this seems to do the job.
>
> The commit message struck me as wordy and hard to follow.=C2=A0 I asked a=
n AI bot for its suggestion and (with a slight tweak by me) came
> up with:
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Instead of using prf->prf_mapn=
ame (which resolves to the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mapped file's target), use Pma=
p_mapfile_name() to get the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 actual /proc/$pid/map_files/* =
path.=C2=A0 These special entries
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can be opened even when the ap=
parent symlink looks broken
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 or points across filesystem na=
mespaces, ensuring we can
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 read the mapping contents reli=
ably.=C2=A0 This matches how DTrace
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handles USDT probe lookup.
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fixes issues with probes in pa=
ths like /home when dtprobed
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is sandboxed by systemd.
>
> which I like better.=C2=A0 (But maybe some other tweak would help better,
> and maybe I've just been staring at this long enough to finally get
> it.=C2=A0 So, I'm not saying this version is the last word on the subject=
.)

I'm a perfect test reader right now, because I can't remember a thing
about this commit.

The revised message is OK, but not quite right -- it doesn't "match" how
DTrace handles USDT probe lookup, DTrace uses the same mechanism when
doing USDT probe lookup (but that's not actually how USDT probe lookup
is done, it's just one aspect of it).

v2 coming shortly.

> I would like some comment on testing in the commit message.=C2=A0 At this
> point, perhaps it would be a stretch to ask for a test in the test
> suite, given that the issues (systemd, /tmp) are so tied into the test
> suite, but there should be at least a description of how -- and even
> just what! -- to test manually.=C2=A0 How would a reader know what the
> problem is or how to confirm this patch fixes it?

Agreed. I'll soup it up a bit.

--=20
NULL && (void)
