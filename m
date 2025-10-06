Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B52C374B
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787862; cv=fail; b=IPbVKMUm1vfNg/WfnhuNDEV724DPeJxGBi0qUEYDeVUqFZYmi/jZh1dQ+a1GWENdIKGo5bHId2OWGMvc/1rQW5X6Q+7ZaxsYHuXBqtbqHpHtcN8vIHBlFEq4rGEXvgbSIjEsL3wJMk+8r3nSAlacclQSJPpQgEPwo0D5tB1A3VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787862; c=relaxed/simple;
	bh=mHFMAm0/LFWokIgLq2/6as9PRefETD77JkGGjxFfB5Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hTQxnUIlccKhvmulDUeb7Phj0gyMDS6qvX6M9NVsHv+B+JFZ1jKqETv+hzyViTwAbT1WhXuPu+/mtocMRkEh1PsQE/MyNQGJQDfcTQhwGN0J36qHUeZE9qTQdWXzlnz0hNnHl1VKAtUaUq6xpMsj5R00RFUfBWXaMfyQVYzT1SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZoZEjVvE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lO3O+bvZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZoZEjVvE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lO3O+bvZ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596LZQFl011308
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=dpa+KVaDUkKOJ5sbm6
	WtE0R8zAnp7zgE3YwrxOzDiU4=; b=ZoZEjVvEstFFjPMPOoD9oFM3EWww5ZOFZy
	2eOh+DJoL4J+mCQ6BTuglCIP/qhzYiq3XD8bs6xQgrCLpCxojslva9oypPBT7zeF
	mZwiFJWJ4TFk4omQfYmbJH8EfjE0oFwsWS8pTC2Gm49qQvXRT2Nfnw3azzHjEDhE
	Tfzga6FyrE/46A3cqP+RBCU3zVkmrmo19meypy9U0gWagmsDeVuqMQkElzbbe12o
	O4+OtEe1zyzp/UkARrzZrdq6OsRmcZUp4cCMsGlDemQKHYoioVgKNHqO4I10BtxN
	RLQ2Ibo8kdIj65s9rmNgJMRjlxgD9eeoKg1h24Lo9vOWWy+rID7A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mnt4013s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596Km5S1004247
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:39 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17n0uk-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtMZYdTJZyH4L2icQXHsM1bBCfSUHikv9QZMgg42a8Ht1nJarbreivhji4xMklNU0/8vs6M6hfNhUd07+6hVq80lm1nf4jHokNzN7aq3mAax6OUEVAiNbQe2rIdmEAG5yR2V8GNty3jNUFE6qr5Hizy02ZYpZ0nZ8C80PiL9tZYNH6Rg9vGX5ikW5gkoOUNjzqx9j7El3AsjNRFNMQ0nq+ctBcgae5bleaHFbLqeyg4rLeudeddZyckrxEaCEknmogt98ce4VJM3o2hS+B8zYnjdsV8o86XUoSrigVdglsXtRl8LWe90FCTUk+Hz6DMXN0nXcXaSv/x4g8nmv8RTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpa+KVaDUkKOJ5sbm6WtE0R8zAnp7zgE3YwrxOzDiU4=;
 b=Bb0LK5fMutINdITZU80wOsZrn5oTzUiCf0ZcNXzPzZCAFheECqLJI7pQsd6Wh7o0Sv7ElFwFhNlShuBg0888isgk2UbIfR72lmNVO+rihqSqn63cxGzILR2gcvfZgIUPAgoFihIGu8XgeI4EeYvfYm1lnd/oH+Zafll2UM6FORBia9wiMG1U3AwQRZZZgYycNJYhclQXwNN4SNwrOYq8IkvCwn+2ECdWvVosY7odDgE5SJJx0W29RpmhxPD8bdgma90+FaOpmY6EOnliOke90aLz0deh/hWRF/DsPlwTFB60tiWApwr0fhkWMVmi5P7iuwyHdIH3WoOENH5rOgw3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpa+KVaDUkKOJ5sbm6WtE0R8zAnp7zgE3YwrxOzDiU4=;
 b=lO3O+bvZboPPc0ohxlIJVRbZWUj2iVBPpnu+FDkbiuxY5iw8HI+CzoHwfL5C8HOnqJgubh9jM8JFFFr44jtuWvLHSW7NyO4lkfY6jnTGXWjQzlGjf2EaDbgcEB0qh1he0V6g8EwdVDpbiHtbtxD7EIiNYBNfB58DyUBMkJlmdz0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:57:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:57:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] test: Use syscall in case of no execveat() wrapper
Date: Mon,  6 Oct 2025 17:57:24 -0400
Message-Id: <20251006215726.8893-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251006215726.8893-1-eugene.loh@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:408:e6::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8b2b5f-e5d9-431a-1f34-08de05235a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GxPfgo5CUPFN/wze/aslvcVjOlh9nBwWDFnd2R6D3IASnQ8ASDFoLijx57BH?=
 =?us-ascii?Q?MpKutOC0kfaFkpBM61kuC6cwWZhyuzx7Iz1gTN+gK540ZqbweExxxBhl6QpP?=
 =?us-ascii?Q?QVcsaHsvBhZa+hd01Tn7L/xu3mFEyinmWUwDOY8v+7LcdHosY8JBz5H5wmEY?=
 =?us-ascii?Q?8R8kHX/xEJyUnNewHTBK9sdPq6+bt6tOHmR0b1FhhSLwl7EOe5xoWJKPLGkx?=
 =?us-ascii?Q?TdMnLeozX1kq2lwPjmx7mN7Gy+uNTY5ynlZOLFvprKeoEBfXBos9IAMdqPBx?=
 =?us-ascii?Q?CXlm8B9RgscHIcK3Q7knOJEQrt/+BkUgtHEPhSwDXzPrfsQC6z3c5SzFvzat?=
 =?us-ascii?Q?0z93xuSYCIDW36RDX55rQwxXgAeluih//mT7G2zh9LaSTb8rfGoDF8/xE/Y6?=
 =?us-ascii?Q?GXiKPLJd1BEI7tgsDIK+uePwnMJ/uqKWtaKu8JGhIqiiXCUOypjsetYwRVq6?=
 =?us-ascii?Q?DujmzzXdakGxXa+mROtlpfBN7/Gew2XmVFb+QU5JA7eAbZjIFmdEBG5+PIxo?=
 =?us-ascii?Q?7W11Ni5NxPbRl2lYlzWVh4MXv7jQMqawYF2idqVWG9gp/FhAob+/bSkTxlwm?=
 =?us-ascii?Q?N4bbjSui2jnrcF0orToHNKtj7G5CS0j6XYAZDWFVQy8hupA0VkAjbzzkc+wz?=
 =?us-ascii?Q?s7a2RnDkgl0i4LNiDGdCnAGLvKoXByaV7p6TeCUsKZ/pNoxAKVC1WLlD9SI9?=
 =?us-ascii?Q?IBcsnXXjgBzAMvCbvztUULFotHqyr2oYgd3xUgJS2jGzmv3qAM0zrHDxI8dK?=
 =?us-ascii?Q?WDSQkQ2dgNXRx8jWviXZDU/nZNjXS5vBnKmk6BgmljWDTUXFjWsbuOoWg5zq?=
 =?us-ascii?Q?MevByZF0CkEXBr5rCg1R0MpjbsslW/OJ1F5Qx9xlQ3523d1mrajiCoSqez6x?=
 =?us-ascii?Q?B0SkfG7+/LtisGgzsGzu5sx4MttEOchImJJNBqdT9hv2XztuyfELvyE3JGWT?=
 =?us-ascii?Q?kxp6u7hoToxTD7pgXBmjAjJrnjc9sLrCpWFWR4XLZr8Mv0suHuf02yb1zcz3?=
 =?us-ascii?Q?7gnw5oBeWZpdiix6TFISBauhqFIC6Wt+9LcKFCLkuOkrdTJ1ERqeP8wXSOxJ?=
 =?us-ascii?Q?5I+cHXh8IXYeu8W2cVc9tI5rkxbEuUoOXimTQYZo80PaFmasYWUeLyfbp/fv?=
 =?us-ascii?Q?UdyhZcuf/qLCJuf9uBDIPjCNV7BnE4zX+rH1KX1aQOmUu1Puej3PzL7DoE6t?=
 =?us-ascii?Q?+LKA/FXdD436dlEaHTvkRvpIfCG2Utu0WIU+vQyLcRnjnqPpoT36ei1Rvju9?=
 =?us-ascii?Q?VV7EfNrKPVN9SL2ME+9SLIoWJGYLm4SwDffLHkS00YuhGxiAA3FSPLvvmq8X?=
 =?us-ascii?Q?GCpdf3X4okTh2aad1twvrm3vWtdgTDLuAMczS0H5qRDCSxJUKTfrSxSgPeOC?=
 =?us-ascii?Q?3pTURhQUm9Svgii1VP0om9w73QuF5RXHRPdeM+We8rTSuTnuEfnZjmdPxfBu?=
 =?us-ascii?Q?+7sE/HE3uTMe9y2E0qKUZBg1ddxZVHAC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4dbQOyK35yQ3f/t62QivMVfyI4Ha61Sdr/hhMBOne2M4oQtMBW+dI/XgB6Ny?=
 =?us-ascii?Q?he1NhxqC8rssmH4sBHEJjiYwTcmXgG3MQs6SIcAV8SexkbzC85arBOpWn8uN?=
 =?us-ascii?Q?pDO6ugO8elFe/sZ2JBeI/tuo/Mjt0k0LIYJwvBemknfYNKWtPxaYxU0kuiSI?=
 =?us-ascii?Q?xypGYCRVwG+Th72trwMBLZnptfV0ChEnIxF8T/Y3k+qkID/Ds/WqtbZlRMF8?=
 =?us-ascii?Q?1KTEu8HKK9opXYICWHyQLcKQmFC3wqJP2isiRM8PzqbHBlvJToplDpibnxep?=
 =?us-ascii?Q?NYNdjQk14B4nHEaCIUUu1IMV4IQPFWN5KtvRnBjEZFIEMsSj/EWbzjB8XlrB?=
 =?us-ascii?Q?CI7rfvhcYhPemwNQpq2CYEJrFHRURXz48MZHVZtHW0VGweUVTxJbQQCTmmJL?=
 =?us-ascii?Q?Bx2NlKmpxTe/Uc0LHwO80+8PPc3bIO42WtsIsOqjr42pDiPvymvExNZMpnD1?=
 =?us-ascii?Q?pAB+Dwpgmeoq3toGBCCE3geOgreLfuO0Sd8AgCYOmsz1dzf6EWR5HYRB7M8n?=
 =?us-ascii?Q?+WIS1DMbeubzW62AKq+ag2QyaCinttfgRWIAj9Vy6cRh0cJSS1aqlsM42qi+?=
 =?us-ascii?Q?fEt3ngzPxDhv4HdCcNbHA6A2RtERHW0wfQVISNO9Gm5LvnmuXE3g+9ityXVP?=
 =?us-ascii?Q?QPlXCR8c62YKuPx+4W7Y42v6v2ytculfoEfBf2PLnuSpgmNd3gdMRL3vbt69?=
 =?us-ascii?Q?WOchjfiB/RvEyZ3eySTygUML5hyMd7qhohPWzndccNBMmd5t73REtMJSx2Tx?=
 =?us-ascii?Q?dPFHbKLE1TcPv/dRNIKclhIPyY9xW53oCyzoSXYF4mCJZh/tqqcLZf0MDiv9?=
 =?us-ascii?Q?lFRD5JoHyfsLjopZASoH69bskNh3OBZl73iZfiuFy+/uSWzkChpo8Q6j12Eo?=
 =?us-ascii?Q?3RaUMlPRJALUVUHR5HtLB69M9+a9STbe8xgzftLIEJ2pt3JFMsMDbZyuiO5p?=
 =?us-ascii?Q?mCP5k4ir5Gr4FZtibl0duUXWuBmDgUECZHDvf1EpAQwXE111dzWoX6aFB/IW?=
 =?us-ascii?Q?g3SD+CkkXtEht4fjd+djxkClAYJQgzNyhpXt3OsAezd43dcn0ErRgudoCFa2?=
 =?us-ascii?Q?ldxVSQdtFP6XDkss5XAn8O2KPWUmhMQz8LWvMvcHbE93zsT12cUfY7PLdVTM?=
 =?us-ascii?Q?0SWxRY96OVJDSJOhMSH12zg8Y+Bnk0S6yjVkJEPCoi31ToIiA/9yYKoAWqMY?=
 =?us-ascii?Q?v5rrZxzVeG5EeJIbmTFjs0B3DsI1lhekVXRMb7gjx8VdWM2iI8tUZBs1K7cj?=
 =?us-ascii?Q?kcfMBbp6v2T9IRoeoj/Ws5VhNUZFOxrxHwZtxMskh9NdhWEQm8WP+Z6gqp0q?=
 =?us-ascii?Q?XVlHCGcPoyhKCDu9VSMcku8JW3yPVCeWLzMxqgqkIVXCweLSNYZAXtvOeU/G?=
 =?us-ascii?Q?dINDf9XXRq8IVrDspdVUZgU8+LXmFehEOm6vNu5OzGBLDJCn8YOxNBDajK8f?=
 =?us-ascii?Q?C+Kj4qz9GHHbOXckcayW/gNqXFOBX2TdgUqsYB8q+1f0JPQzgqXCtT9E6R+f?=
 =?us-ascii?Q?odKRJPOiZxH2wNixnrzYZIAZeu07PrS6WLMdYxwVsnvztTqUcyDSv9zTOWIZ?=
 =?us-ascii?Q?3KMHUrIVe1m7EUE3layQgfvN14mzT08fKMoQzaYO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xt3KECqBtASPRZzftG4vUf7w1T7KMhYzQfrGEOSQAo5Cwr8GrSw6umdwu3w+Cwf+QB4ExBmZwoT1WA6QhnOxDKKRbA4K1cEMLrxRIYh2jOIYlHLZRVyMts6DrAiqYWOXSIUNjKOCsa4+d4DvWwAyv33Ksw/P3q3Q/Q2s0HvKfFEve0pZTcMTGG9j3R22K/BQJ4jPnWL63J0pbU0JXLTCxnz/8wFdBA9by5boup7Z/ADyJsQifms2d+9uGH2vKcRImpdGUWM2lbvVr7fjzQUFW5Spy1wEPQUmRTuZHllQXoD0UJu1UtWpNQBJVKdy6ywKouDc2E6EmQT2alyHJ1XpWWVkuXq7xOlLFyqxG94ItEcNVzz61vGzY+p8VaG+15/mdCfiqkq2oy/gXHh0nCR+N7SE+xVuwPSs+QAVRjBMJeL/nSTjfGbcUNl+jHNRDqKnRb86wPrYsXArqr7rdZwRg1I5HYoPh5igMSRPwYp7F6Ygwwtvv7umW7k0yJnMWJNY2tHn45QPdlOfIMhG0ckdFlX7iZef82eZIgfkq0+LrTI7L2BSSLVU0sor7FOQRvKaupNfQru+hCEX9Dsk1TiBQY6g+ODYkm9DDvxydIQ/Y2M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8b2b5f-e5d9-431a-1f34-08de05235a0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:57:32.8679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQpYtk9S3ndEogcVSi+1AdkLB4qoSoQmVwO6/hy/1jBdl6VDQUQVrmLCEPNwXNs45nZ2ZHz0XtDLY/wDeBQYqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510060172
X-Authority-Analysis: v=2.4 cv=XbuEDY55 c=1 sm=1 tr=0 ts=68e43b53 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LxIp3S0m92nc9jXn0h0A:9
X-Proofpoint-ORIG-GUID: gSI7yzIU2icKn2RJr4m8WlnaFH2khs-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE3MCBTYWx0ZWRfX1LZeCadd2mEr
 QTnxNc7Kk87UI+eUoS5MRm69KXX/23L5J89rFLJMEVcLVjNHhfgtvpPQ5ybRTWgqsc80Obk6ZAV
 J8i+zKtEZoxMiBj7kCT0Jav5xX+YgsLyOASVNIYoVlynd9MZd2yxk1Zj9zP0oAPEPHpebSfzSQw
 kNx1wTo+UB/8XEW/VtLA2kbYCtS7Wh/6nj2mMaf9dU6MRiffQveBkGoGQvMDLM0G3zPwIPD6dlP
 jNazStRkOc3eJoZB+nP1enXySP7wupeNrbrnFw5Zw1dtfS52VFM76heDgdW9FAfTMC0z6LJFRKk
 TMfcZwLWu/onODWw668tgfY1YW4AuRay3rFyomrihXXiLbSqG0y2LyPIR4WbWOrOrbOhG563rVg
 frbIejPZ2gLahrBhXRzy1Kiz5/TejQ==
X-Proofpoint-GUID: gSI7yzIU2icKn2RJr4m8WlnaFH2khs-M

From: Eugene Loh <eugene.loh@oracle.com>

While execveat() appeared in kernel 3.19, GNU C library support
came later.  We are still testing on some systems with older libc.

Do not assume libc has an execveat() wrapper:  use syscall().

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/proc/tst.exec-execveat.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/proc/tst.exec-execveat.sh b/test/unittest/proc/tst.exec-execveat.sh
index db68a5043..e4b9dfa5e 100755
--- a/test/unittest/proc/tst.exec-execveat.sh
+++ b/test/unittest/proc/tst.exec-execveat.sh
@@ -17,7 +17,7 @@ cd $DIRNAME
 cat << EOF > parent.c
 #include <stdio.h>
 #include <linux/fcntl.h>      /* Definition of AT_* constants */
-#define __USE_GNU             /* so unistd.h will find execveat */
+#include <sys/syscall.h>      /* Definition of SYS_* constants */
 #include <unistd.h>
 
 int main(int c, char **v) {
@@ -26,7 +26,7 @@ int main(int c, char **v) {
   int rc;
 
   printf("exec\n");
-  rc = execveat(AT_FDCWD, "bogus_direc/bogus_exec", argv, envp, 0);
+  rc = syscall(__NR_execveat, AT_FDCWD, "bogus_direc/bogus_exec", argv, envp, 0);
 
   return 0;
 }
-- 
2.47.3

