Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1BC2882CE
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279601; cv=fail; b=JJ03nC04cDeDWFZAIKbJ2glo8HIUi7H9QtVbKY5a9EeRSNb2jt73XMEC69l843vk8Bw6WflRnaKSdPk4wCnewwciFhYxmgXhOT4UgbU+kzOqDqL2dazXhMu63s+A+Dj37y80v5n69GvIxKK3eWxs2ZmdcTeA/fwThfT/YlcfsTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279601; c=relaxed/simple;
	bh=3SqE5hiIbtPfqfXjTQiSzsuWz0m5O00C/zMChxhJNHA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ryVl2xyGUZX3OhI5g76FFORXM9WxbyZUCcD+vfViMPmRIRQ3YDLcxm9rKQM0RPNxKx1l+u/uBBX/AEGumE0q2EP/+MkkLxJF7gVjdmRi/Sp1Swk17feqoJUzDHry/2m/Mr2FFMByUdCacWQ25liOziSEMIrD+I2C3FGQ++5YbW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RgsGXYgO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RHeVLSAA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RgsGXYgO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RHeVLSAA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLLc25010626
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=u+DO4L3uWJDnmev1GAwgOcFjadAsD3/3dgktzKhZjlo=; b=
	RgsGXYgODzYSUabBEr3YIuOJba8pdDOiS6VKstWoVScwD9mvy6mpjKUX9ppq5aBG
	RpTciKXQdyGd83tUXmO1LjZsh+lsuovd8XMQzwSiYuvQv7vSesf6HhPLEuCSKDOY
	1YoTsRBG13YGGmUVB4H8T5qZnVr1M0B/4iP9lSp8v6qjRiktQXvQ0Fno9pdcJz1c
	zC+jP18zfmpaJgUaiRIoetrcDn37+SAk1R9KWcIjABqS6Z2iIbVmvcbuOXast4QK
	GD34KnSQmA6QpqTOzYjQ+mFg4N0ai1DrUc0vo/sTFYc39YG9Z6ELZP4m4I9zVqFt
	MsULdUF7c+NWG6MpmYCFcw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58s5wb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:26:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57R63GIh005066
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:26:37 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8ansbb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:26:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yO939Aw9v/I+AA0Q7LzW9/dpU2UhNRqfchVJZFnynsUvbNKJ7U+xJVQsgkzOY74pliF4drLYs7ZGGCRMZfXQRuta3pUShlMprGU9r5U5V3pplxv/5mvrTfJUhc5ROErQFpQ3Ty334U9XRE1sEYvCTZ0WJhL0yRx7P17741SeygGnTdwFAvejYXGjimHQV8mxJlanXFDB4+QReen1uvLLkag1M4QaLF/9UlWdRVc+iptW/ieC3WVGAWUqZfcY13lDXV66EY9vAI8DZ762343ttBq6kT2ARa/EZGvyffEUu9nDolH8ozkRygrbnLQNxhjqtGT9RRp7hohURvZkBvW3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+DO4L3uWJDnmev1GAwgOcFjadAsD3/3dgktzKhZjlo=;
 b=aKkF4VRzYfqq8KuwimlLc7jdxTeJfxT4L4W6ufirmU+PwLdm8Vb2Rv7ao2lC3JNvSYcpLKcWGtnjJtNTtFBny0zQ64P3AqNLp4aIH03jo/B4uLuUMHiccjS4t2ZbuM6q3tO7Lf8G7gD7leoSc75tZMnao2iz/QeMM95Q9Kad2A4yeyJFPAZDT9b6nvyaFk+S3y8EahlK/NyslWHBu114c2+Xs50CZMMYInFVF1HtT4UE6YOHG1IxMdoQ71Axvx74tTBDGM6s1K/QWTzA2aVscfOUaLbwzrUWdsqbFjkS+CwNgHas+hijgWLlIABc3rpwP03/5w/kyz67Zf2OCkAThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+DO4L3uWJDnmev1GAwgOcFjadAsD3/3dgktzKhZjlo=;
 b=RHeVLSAAa5IY7j4govg4t3KXIMXPEr2b9wVJgd7VyHgSn5u3Vng48KqU9C2SFHixPiryiw4ViPqtB+qF3Oy2zZziQS+tnWX4YnN0tNAJ/uuZWz1zW2wd20xC3y/IKyr2uaOW3Dym3KqrE8N939ZJ3F72Rl0Y0THLr/7Ru09e09w=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 BN0PR10MB4982.namprd10.prod.outlook.com (2603:10b6:408:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Wed, 27 Aug
 2025 07:26:35 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9031.023; Wed, 27 Aug 2025
 07:26:35 +0000
Message-ID: <710a916b-ffee-4049-b361-d1ad60641976@oracle.com>
Date: Wed, 27 Aug 2025 08:26:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Convert ip6_finish_output to rawfbt
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250826220454.5003-1-eugene.loh@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250826220454.5003-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|BN0PR10MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: c8109e6f-5843-4ceb-8430-08dde53b0d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STM1Nm5qTXJLeHppWkVER2ZOTnN1WnNFUVBReUxRbGxmOGZHZ25sYSs4T2Mv?=
 =?utf-8?B?MGpKZTlTc3N5alZWemU0T1lWVDl2a1hHT0lEMW1WbXdZaFZwT1JuNUJheEsw?=
 =?utf-8?B?YzVObEtydi9uUXRnOFNxTGY3NXRPbHhNc1NZNnRwZWkrQUhtREhQajZLbkVG?=
 =?utf-8?B?SE1RNkhlUmVrekttUm1ZaWJubHVwQVdiUnRmbWh3cHFXdTJ3aHVQKzBqZitF?=
 =?utf-8?B?cEIrUFVjQXVtMWs2MmtqTkZ3UEJmb2V0Y3NXTWNMMmNqcFBQL3ZEZDBrSlJD?=
 =?utf-8?B?dzVxWkEzdkVLL0xSRDhmSlQ4TU12ZGJoSEVQL09xZ1lLN2JmNC9RbXNiR0Fs?=
 =?utf-8?B?VjQxUUlkMGZCd1QrR1pzOS9XYzNzeFM1S2FoMWVBUklYTm1TVzlmL09BV1Fv?=
 =?utf-8?B?OExsZ2lWbk1WdTFaLzhYcnc4TUx5OU1oa3lsanhKN01oY1QxbFdaTWNLdXZV?=
 =?utf-8?B?clRVWDU2K0xhUGZDSGk3S3Fvb1B5S1dLVEpjaUpjZnhCUlJ5aGNva3h5a2Er?=
 =?utf-8?B?SFVIZG1VYjJEaTZNeFNmWXExeXRvcU9ZRXRZQTloT1BPRHVMR1JnVUxFNHJp?=
 =?utf-8?B?VGhndm8vekFPOTVxOGNHUnRvNkkwbktvQ0ovQmRwU1RsdjFjTEc3WUtjakpu?=
 =?utf-8?B?WUhmZ0RrUlNVWURoblpnQzFwT3FxZFRMeC9VNDN2UGxBZmhPZWtvUndTUkVn?=
 =?utf-8?B?ajVQdmJhallYUHllNmJ2Yy9KS3JFcVBqYWUwL0dLUTVoem80Rml6eTZReWtw?=
 =?utf-8?B?TFZnZDgrLzFRVjBUWHRPSjBBeFc5Q2FybmdIQnBTbVY3Q0p3alBDWHVqaHU4?=
 =?utf-8?B?U0hHM3hLSDFKUGV2VzNYamV4bmtmWFpCM21EZkdFREt2N3ArSER6Nks0Y09T?=
 =?utf-8?B?Um9uc3BsKzJPT0kyNHQ4WmVCb280NUNBVWx3Ry91NDJpWjVsSjA0ZGFySkVS?=
 =?utf-8?B?akZHVU91ZlI4VzQ2Um1DOE4rc25wMHBqSWZkajdhY21ISDFBaVhXTFZCMk01?=
 =?utf-8?B?OTlnTlR5c2dGa085SEoyNmpxaTFBOXZqMHp2YU1VR1l0ZHpLYzVTMHRnTkV2?=
 =?utf-8?B?QzBkRXNZWVZlMGNWSDJndjVaK09ySGxpbGFIWGtocVRTMzBrb0VUVkE1RnhR?=
 =?utf-8?B?b09pZSt3eUl6NG51TjU2M3B2dlpzZzR0bHc0SUdnM2VTcGNVOW42SmM4OHY0?=
 =?utf-8?B?ZTNXQklkZ2R0UUVRZXo1eVhLNzY0bnU5WVg1UzJXNG5URjZuNVlqL3FLRU5i?=
 =?utf-8?B?Z2dKM1Y3V0NTdU5aZUxoTFNJdXlHYTFRZVhGSWNNMm11VWFXZ2JSbHRBdDhK?=
 =?utf-8?B?OVRtL3BOM001OEE4dFVNTDhjdC85VUY5dVpvdmdSM2Eyc1lvVFNxTDl0czd0?=
 =?utf-8?B?MnZaZHhrVEp4WVNSbkNrc2ZRVmJBZGNWck9OYnVYQmc1dmpvSVNmUEc0bkZ4?=
 =?utf-8?B?UlVyeHp3cWowY2Fuc2FidzdzYlJsS0szZ3d5Ym9lZmtKNmlnTERJdjgza3Nh?=
 =?utf-8?B?TU4rVHRIcW1YTXJiZURjdis0Z2N1RDY2UWMzTlkxOWNCUmc1cXQ2TWJBaVI4?=
 =?utf-8?B?MmJRcjB2czJJMVpkL0Fwd0lPTUEzVnBqMGJvalY5WU91WDN0TEY4U2VNK1R1?=
 =?utf-8?B?NkFyb09mam5KUUF3T2FZemFSWlY2VWNucXM3T3JISVU0Sm9mUGk0RnlTcjRn?=
 =?utf-8?B?NTIzTWxkWVlNV0hQRHdhK1ZDYmN3V3lXWGRrTDFLZkx3bVhBTXpWNjRma0tX?=
 =?utf-8?B?cnBVamo3TVJXRm03ZjRJc0dhM2htZVZCNzhJZkRuOUxQS21rUXF4YXB1d1dz?=
 =?utf-8?B?bS83YjJBcDdydkFoUFNlVWVnRmExVU02cnZ2bVNKc2pmRWRKdmJYOU1WWTlI?=
 =?utf-8?B?bGNTaUlVZXd5SnFRWmpzYVkzbER2c3J0Ry94UEEvdjVNbnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEN0eTNkcHdySnBUeG1vWXpkYThvZzdKSmJnS28yb0V5TEtUVURsWjZWN25M?=
 =?utf-8?B?Vm9oR3U5YnVINlI5RXFuRUZmZmJjYjQyRU1rOXVkUjlCSHYzNHR6QldOUmtm?=
 =?utf-8?B?ZEY5aWlRSlBEVEhHVkJkVWNTdzRUODBOWTEvQ1FucEJMaWsvODFCYWtHOE1u?=
 =?utf-8?B?Si9hTVNMakRBbXMxZktyZFBORDJMVkphRmNVcE8xR3crSDh1c3V6dFlGaFZ4?=
 =?utf-8?B?WExtdS9qWUI5YWF1T3dsQi9wVHZHVk4vN2d2bXN2TWZaYzlTQWdUd3pNa0hB?=
 =?utf-8?B?N0ErSlFDVTlmQVVURUF2dFBsZ3liZFpaZkE1UzBTMFdlVHZrcGlmVExNQ3l2?=
 =?utf-8?B?U1lWeEpHQ2x3anVMM1lqUlFPNnRlRXNqK1EwRVlVZWVaN1l3T2p2eEdHTktK?=
 =?utf-8?B?bW9NZ0dycDlJY2Y2OVFMa3VCL1VwdjBhSUc0MHZKbC80OHI0WW5aVVpVUUho?=
 =?utf-8?B?QXJhdlBMd1BHNThLRHNTWmh5czhGczJzWFEvRnV5OXphN2laM2p1Rmw2b2RO?=
 =?utf-8?B?Q0k5SkhqTVI4TlhYNStZVTlNcWtJK2pSMjM3YURpM2YrMWdBN1NndEhzN3NH?=
 =?utf-8?B?TjFMS2FzRUFHZmdzVjMwaTcxbUVQdmRMNWlRcXgwd0l5UmxzOHJkSERJaUh3?=
 =?utf-8?B?L2lmcSsvT1RuSWJUb1JJSmZyTkJMWVVRMy9PbzZqMlBHc3ZPWDRFQkdsWnV2?=
 =?utf-8?B?QUpxSVJSOE9wWlV0aUtxRFBSbUxtdHhhcnBUaElEN2tyRWdKMTdXaTdEMklq?=
 =?utf-8?B?QlZ1K2JyZ1NObm16MW5CVjliTUxjU3BZNkM4WFBpOXpqVW9TTW5wb2ZHT2JM?=
 =?utf-8?B?eSsyZyt5UngzYUVka0xDVVkrUW16TjVXVmJMN0ZCRWlvSzE3MXRGeFkwUCs1?=
 =?utf-8?B?SmxlV1ZiaFZhd2p6SGp5OVZWMjRSTG9sbFdIMG1ZeVdpSkMxN3l6R2pTZXFz?=
 =?utf-8?B?K3RSRitVSmNzSFJkdnJDSi9VTnpNeUJPRDJidm9LQXVlRjVhc09LVEFlalRI?=
 =?utf-8?B?SlFrY2hld25OK1NMV3NUTU9hcjJNUDloRllWUXgzZThzcDNRNnNpYzZJbk9R?=
 =?utf-8?B?L0pZVGIvOFE1dURkRFpBcXJPeHl2QVdveDl4ZW16b08yZnRyM1NFZFNZZ1U2?=
 =?utf-8?B?Rlo0Z0Q2RWM2aVJMU0xhL1dVY09RQmpScXZ1M2trc0E3MVZReVFXbm1sWHFi?=
 =?utf-8?B?MVJRTldrWnJYRmgxY2pwc2h0YngrcVl0eWhjNDlYdXBiV080S0RvYWZhS2Jk?=
 =?utf-8?B?UGxpTWNTSmhEdm5ubUlsZkpiY0t5N0Z5Y3RuRmlXZUpWTStEdmZoYUl2TVFZ?=
 =?utf-8?B?RjErc3hWbEp0K2N4ODB3TUNyTGt5clVUWEFoNFg1UWx0MlltTDE0anRLOTVo?=
 =?utf-8?B?bDV4ZkNPVks4ZU1KdWsxNHQwQ0FJcmx6OFBmemZkR1VOM1REMFNwaXdjN240?=
 =?utf-8?B?TzZoRTAwZ1dvektpZE04emI5TjB4V2UrWE1TTU1KQmhWT0xPeGkxT2t0TDZK?=
 =?utf-8?B?TjdWWDMwOW82bEtocUttL3Nwb3ZueXdsVEdFZlhqaFFQNWNKMTBkMmtrK3hY?=
 =?utf-8?B?bTZla0lNc0dxdm8wOGoyWWRGU0FFV1JXaHlaR05xWWwwZXl0c0xxS1VqT202?=
 =?utf-8?B?cTNGVHBUM1lNa1hJZlZlMzF6eHVBdW5VM1RBUGJsQm1WY3V2YnFUTERPemtU?=
 =?utf-8?B?RUxtYUkzOWRHelR3MkcyMW1CVG9FUHIvZVIvamxRV3FUcDViOERnWUlRZHp6?=
 =?utf-8?B?SkErdU1ONlA4QmtSa1RTc1lRNWpqTysyaGUxVVFtSmtCb2NXRTI3ZW1GaGNs?=
 =?utf-8?B?UERLTUF0NFVZSTBQOFkvWUN6TFJ4aDg2L21UdGxMLy9oMVhSM0JyZE5WWDRx?=
 =?utf-8?B?SkJpRnJad0ZVSTVxak1OOW4zMytxWDRVQk5kSmxWbkpMY2lFM01DbFAzOEVZ?=
 =?utf-8?B?T2VNOTR1Y282R0xXc0FHRnRYR1Jndmx5VklkdER1SFQveU85T0lYcnEvMnoy?=
 =?utf-8?B?WU5TbzgxeHhKNG9ISm96TjUrbUJsUjBSMHJ2WFY3bGdwYlRxVHdIUkIwVXla?=
 =?utf-8?B?cUV5M2t6cnhnS1VpL202c1dpMGs4eDF3SVNPZGtxaloxc2k2TStGSXk3ZndW?=
 =?utf-8?B?dklnQ1BpRnBzeVROTzRFbmdMakRjamhRR1dxanpmYVpQTGx1NGdsbzd5WXhE?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4dsWG9znt9NliX4OHpash3mdfWdRKpphpzO/jgZkY41kqCsko0zWjrsa3ZkQWGoEl2DoWFo5pOPDv25lgLnnyKt63BDxZSYyE4AOvbn2iD4nUjtrMCQrgpD9PnmIgN9d9mHN28tDXwSBZ3VuQ8nQ1OKl8b1JxIT268s1obd0+w9m69pekJ90eACk2eNI5s0Uk7nC8V081yPZwPZmDNLgiETy1GBiw2HGNBwPa0XvQ5raCt+BlolsJ55n/Qs0Eqpc9xeX2NT/vYDANRfsGeDJf5Nl0VqNky8Rc3GvSQOn9WCazcKGQHzHal+6Y0GsxMXJcm1Gm8yTsWbVV8NXrDgnSGd1+1NAI6AIsB1WupyovTOOF0Cx0UYaEwqO5+sw1zS/KcADrJQe2vWskC/54pr3WPYMn86sh3WtlvNbl29YsBnB1fdGwUSKsx8hu1GA6b/chdP6xHGwvcBUOoBNBK7lkJCyE/NB5lF5mjhB+AzqMUICEnkUOkaSwVM0mGYMNnrU240c1w/0tNx23lyau64OlPMZb5UtM0p9VI52cZMAmb2iiXeAObS5HH1AE/Th32VSWnSZpKxy5UmxDcSy1hogdS7PQ04LYwbb4kXDkatayIQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8109e6f-5843-4ceb-8430-08dde53b0d9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 07:26:35.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1B3S9rhavLuwlY66slS0VkhAz/cfsHDLD1nAjGHiNf4pbN5x/ugcuWb9ZPY758KhnM1BveZnYEsj/Q+NmtLijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4982
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508270061
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68aeb32e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=nV0R-6Et6d3RPiZgLJIA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068
X-Proofpoint-GUID: xbvBXFo9pU6eDiOgzk6ZkVbmlAD8I8zW
X-Proofpoint-ORIG-GUID: xbvBXFo9pU6eDiOgzk6ZkVbmlAD8I8zW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfX2lBhTfUu1mJT
 QwBtooTSeEKaU8xv1hZjGZeYHbBZUnhGbtXQuN9T3O+UmhzdYQZAUm/Ms4pGD9eB8K+UA51pDQl
 tGrkQN1SRFqZ0OZsCOsGZij3rgepQGX5mIFnTIJcwKyB21mqtkq9hXWMFTOwBIRvvv9giO4l8bE
 NgMB3vUlRm1SqCk4mc9+vja0ZhVq5UM4Onvhj4f00h1zCMLO+HX0pq0+GRsFhv7ESJCCtaISZYF
 dO8virDc1CU7gvcsvpEzRfTBvZ5nWTrCeMaA/vdJIwZP430LQkpgF8f1TxcScNrdD2gmAPvn3AE
 maN0bugK2fLBgY7lHbTBRelopQ0fgAKVufL7gIP/QmitDkeDFiDLJ0jrXT/SAYu153imHZXffh+
 YKeOwyeH8R+Ko0i4wXjawsllfPLjzA==

On 26/08/2025 23:04, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> With commit fe2101e55 ("fbt: implement based on fentry/fexit probes")
> test/unittest/ip/tst.ipv6localicmp.sh started to fail.  The problem
> appears to be that fbt::ip6_finish_output:entry, which is needed for
> ip:::send, does not fire.
> 
> Use rawfbt for this probe to revert back to kprobes in this case.
> 
> Other fbt probes may also be impacted, but this case showed up in testing.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  libdtrace/dt_prov_ip.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
> index e09198061..5384346bd 100644
> --- a/libdtrace/dt_prov_ip.c
> +++ b/libdtrace/dt_prov_ip.c
> @@ -25,7 +25,7 @@ static probe_dep_t	probes[] = {
>  	{ "send",
>  	  DTRACE_PROBESPEC_NAME,	"fbt::ip_finish_output:entry" },
>  	{ "send",
> -	  DTRACE_PROBESPEC_NAME,	"fbt::ip6_finish_output:entry" },
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_finish_output:entry" },
>  	{ NULL, }
>  };
>  

