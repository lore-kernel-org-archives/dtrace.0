Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE18621
	for <dtrace@lists.linux.dev>; Wed,  4 Dec 2024 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733270916; cv=fail; b=fqjoF2rHLcn0AP3+QBXoKS2/yml+Tn8P8M1z0LE/2sWTDYnRD6DsG/v4M3VIJlytX6Xlf96psMbp9OvDXgeEsjmKKBO45jV2x3gkLVH4qgL+j3uS3cey882rHwrM1N1x23ZCcjowrS/nKyNQO7HvGEIBwSH+Hogxuco7jbDTGXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733270916; c=relaxed/simple;
	bh=LMqjIFRtJxE/HKBsfxNtNwSfU+g4Esf3BVegPcV+aic=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=RgqOLX28BUj3jXpsQSlHK+aJlkQVYcc2Dq+WEJimCiWf81iCivNzlXS+SvWiz4s7IxST0q8qvpjaaMW84M38C5T1+EKfUGhE8VW92qNw7XJfL8jBLX2p11CCvJXT8QN9iymSdZx4C2O+c/hY6wQxGmxBZaZGaRUqSysCqmdX4vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AGWO7772; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wmxffPuN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AGWO7772";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wmxffPuN"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3M3Edx029557
	for <dtrace@lists.linux.dev>; Wed, 4 Dec 2024 00:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=LMqjIFRtJxE/HKBsfxNtNwSfU+g4Esf3BVegPcV+aic=; b=
	AGWO77724g5Frho/FvEffzT+k2HxiONE0RKm+oosrObi457drFvkmgfnbfu1mOtF
	GlUfb2O8hGE6Ckiy0twTagNLU7bYcHGwV9pJi9sZDCZ8ZxMxGpgInCQxSoGTPgyR
	5BT1djvJ8005c+tK2bU4nLoJRJm+JqZOOLueRZDvUefNwtq6ZsuVQvqJ3R8WI/zh
	ZzAepF9que/Ap9RWl+ssUxTkGfq2G4wm8AUnfHcF6Rb1g4nUqm5zWtLCKMWXyuv7
	Nv0ja6XOJL9o4aQBoAWckvng0laH91txn/rq2pZXtc99dWzLxJ5Tdy8AgH6bAMh9
	MXiaFzNeZ+WUMXsYgsZocw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg27a3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Dec 2024 00:08:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3MSv5i031616
	for <dtrace@lists.linux.dev>; Wed, 4 Dec 2024 00:08:32 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836umu21-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Dec 2024 00:08:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO6TQLgj/B3YBrbrC+kt0mEE0tEqniuZ7jYxeLxuHz5xEmc1CkJ7N1jCfvM4n28HhTEPr3LsSDGhx0ADRvUnvQO0iVsElIrq13vttSBPxBytHwrZj57oA0B5Hy1UBhghlcXtbb5Yavm7l2qlwN/k7iDGJmlSQZyJCf+LGUE4RKrlVwAiQQFuyY6V1sjxY09izDy+iKzdOlQw9FWXkZ1bekAnhccQLtcq0seDNFHxa03FoNLoVl1ZKBRK5oSSanqBL9fMo+DGU5OLlE28i5dmyr+MEuuePN1gkAniCW6wl+JIGSGQcIt0n6JK9mDp1MmH2/QNzuW6czzMxmgtMTnPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMqjIFRtJxE/HKBsfxNtNwSfU+g4Esf3BVegPcV+aic=;
 b=NzwGUB385IyttJhpnlS0QItq9Ylf1iseUZg9VRgoy3K37rboJsH0qgR1r9KaqNUz5fHyWeatHtcugFpCN24lvn4sr7WC7cmuazoQJvkxEqrjgpD7I/YFEBxvLDaGjzbEjk3RjW3aFreu3XA3bXmLqNu6+s2HYakphKZLiLtjUJAros0gtVeykfwK9VullV+tlEnZGRwjx6LkK/W1Mfvkj6nBxZ74kj/X3XzbLPYH2lo0YrV396bPb4/e9sDt96PXK442HdPmuUSozESx4+MvqXHpB9DmKaGzJWA0UeFmCpHpXLXNfyL89f624TJqCuLBpButdLnxeUlBwZMa5DdaCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMqjIFRtJxE/HKBsfxNtNwSfU+g4Esf3BVegPcV+aic=;
 b=wmxffPuNHc7/ODq8Jr7yQiY/5c5/1iaYIGpDfwQLtRfw7b++cfr92NdKX2K9cLimhslEqTUsiPKx8/I9a5AUm+UPo1kRdRCkLoqPyK3TZDJtHXB/h5xj5pT4RKXr4FsMqGj20JDSvdJy2ToYIAUMJMolOICCof2cKRWJPqg8VKc=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8083.namprd10.prod.outlook.com (2603:10b6:408:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 00:08:19 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 00:08:18 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Eugene Loh <eugene.loh@oracle.com>
Subject: Re: [DTrace-devel] [PATCH] test: Retry umount if necessary
References: <20241203201601.28787-1-eugene.loh@oracle.com>
	<87frn4y0dd.fsf@esperi.org.uk>
	<1517ff3b-34e8-3654-a249-ec7164b66cce@oracle.com>
Emacs: don't try this at home, kids!
Date: Wed, 04 Dec 2024 00:08:12 +0000
In-Reply-To: <1517ff3b-34e8-3654-a249-ec7164b66cce@oracle.com> (Eugene Loh via
	DTrace-devel's message of "Tue, 3 Dec 2024 16:06:04 -0500")
Message-ID: <87mshcwbrn.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0134.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::6) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 3627798f-bc87-49d3-9278-08dd13f7c1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVU2RG9TVlhsaVVPS2tiL2hJb21HVnRMQis4SVM0S3hoZjY4V2ptellaSDFw?=
 =?utf-8?B?S3gzRytjSHdKSjc1RnJucVUzM2p3dGNQc1ZvK0NTY1NRbUlia0FXSzhjZjh5?=
 =?utf-8?B?THFqUVQ0RnZ1LytwL1NKTEJnMFBzSktKN2lxVHNjY1JhWHRwZFdTWTNpb0pt?=
 =?utf-8?B?QWl5c1dYbnl6QVAyQ3FNUFNwRGUreHNaTzFwRXhJTEFNaGdFc3NNSTBrZGxm?=
 =?utf-8?B?RVF0WUZHSjV5eFVxdFhDSC9OUjVrektmQ2tsZHkrc1hWZEFnekNraTdBU05E?=
 =?utf-8?B?ZUZUQXpjamlKdUFVVDh3aDh4S1ZNdllaZjNQcWpZN3BWNytGK2ZLUTNyZGl5?=
 =?utf-8?B?NERTWmVjWXpVNEdJN0U2UXBJWUV5MGZkRlFBUHcvZzdXZ0tiY1dTejRTa0Uy?=
 =?utf-8?B?T2FVYlg2aHM5N2wvRDNtVGtYVW13eG5yd04zSk9yKzR6b2UrL2xNSFdqUnJS?=
 =?utf-8?B?WnI2UWpKOGFGaTczTWZxYjI4WUJhMVJ3Z3p4ZHBZOUQ1Vkt6T3FnWTFwZlQv?=
 =?utf-8?B?R0JCaFVzbU8vQ3QzbWlnZEtQTlU2MUlCYS8vRWI0VzBpaHUwaXZ3UDFHZDNr?=
 =?utf-8?B?QjN5RHo1UjN2V3V3VnVTOGsreklxckRpZWhNK2JnWWJaajBKY3JvTkVHZmx1?=
 =?utf-8?B?bHJYM0twU2tkMTZESzBnaHFXZytoS3h2Q00yQVdmVVVvU2YzWXpTdkdEK2xG?=
 =?utf-8?B?U01KdlcyN01OcElpZHlNRnVuTjdFTU9qS0VhSlk5U1MrSnRiM3RjZEE1VmhX?=
 =?utf-8?B?V1NBZGZBS0hQd0dQNjh5ZTZxSDJXU0FNZGN2eWoxV3lvWGRqVFFqcmFkMnNi?=
 =?utf-8?B?MnE4dzFBbFR3Y2Y2NlNIemtJMHQwUmNMZDdGL1Q3Y1hHZ0pCR3ZmOGJvb29p?=
 =?utf-8?B?c1U1ZC9ucXFUL0RVOFpJUkZiV2dpUWJBcHU3TklZMXNHciszaUUvdGV4dStt?=
 =?utf-8?B?bU9hTWc3ZTFLblBaZmJ0T3FvRE5jZ2FRa2VBQkVVa01GcThPaDJKQW9vMFRC?=
 =?utf-8?B?NldPZXcvSU5pNFdNejIxV3pEVU54K2kwRThRZlRrYVNITWxhaHJONzVoUmVo?=
 =?utf-8?B?eHZJem4rTCtNdFhDOUFyUkgyRmt0ZCtCNGUzU3dQYmNvb09mbXdiRm1YZjFI?=
 =?utf-8?B?RlV6Q3hwcVczSWNUcG1xZWkwUW94U1E0WWswZGtxWk0zWjVuejdzYitpeUZL?=
 =?utf-8?B?MmpSOUlSaTJvZlplWGt4MkMwcG5nS1g1YlNzVHRqMm0vOHA1WWZUd3RGZmhV?=
 =?utf-8?B?Q3JzN0RTVkY4eHJ4QkNiMjZTVXdhdkdMV05TR1ZESHpmTXF6VUQyOXphZ3Rs?=
 =?utf-8?B?c3hUZVRuMWlvclcyN2wwSnJlalluR3VPYmRQWDMzK2hrU05sUEQrTmh4NHhG?=
 =?utf-8?B?VkQ2NGJRdERjd0NsSnV1SGNOdlZOMlY4K0RJQXI3dlVmc3RBRVhzMy9xV0dK?=
 =?utf-8?B?d3lnbGNaU0pqUGt5TmNtQS91dGtwbHJoOXBuRnJKRFd0MWg4cnBWTy9Eak5P?=
 =?utf-8?B?dTRwOTNZd0FQRVpXT013d3puRlpGUTBudGV2NkhSSFlkZjRLaFJUdDN0Y25Q?=
 =?utf-8?B?T0wxdGlLb2kycC80MjN6bzBEbmgyZVFIT1g0M2p2ZTBLWXQ0WWhldmJoNzk0?=
 =?utf-8?B?dElXcUpib1Z2eXNJbkd2S1dFVXZRdmpiaUcwYWN4OW56Mys0VE10SC9mNzB3?=
 =?utf-8?B?MVVHbjdoelJlWFVDUW9LbUlNNjVaVlZOTFF2RDB5bzZPaENWcHRMeFl5Ymto?=
 =?utf-8?B?bDVVQVMxaTNHVGk5eFRxUVgyNjRMZWtNOFdXNlVOa1J4V0Q2SEdhSlRFajlC?=
 =?utf-8?B?YkNkbkw4R3JLTy9ZSExlUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWZsdFl1QXZLbjlKNnd5WFRDQndyVFAySUJ6Y29taGZId1JoaDlGRStveEJY?=
 =?utf-8?B?RlV1KzlOdzA2YlV3b0pKd2I1NktCTkpsUTFQS0FSUXppa1JqeHlzd2FXS0Uw?=
 =?utf-8?B?UzR6a0c0OE9mbkNpdURPS0grMm5lNGYrdW8xSVlRcXZTQWNEL0o4ZVg3WUV2?=
 =?utf-8?B?eGVhanVsOGt6S3ZCUUN4Q1RVNHRYUlBZQ0p5M1JoMWFTNGEzZ0NieEdDUkFr?=
 =?utf-8?B?TW95RjNaZ1FlQ2M4QXpQNVNZSUhnQ0t2ZlFxb1BMblBJZ3dBcmRaRDRPZ2Zm?=
 =?utf-8?B?SVhIMkxDZXg0eGJkY2Y4aGdpQnl1eGJvdEhoaGk1RlRlZE1TK0IyZFIrTHBH?=
 =?utf-8?B?eVdGQ3BPY2FCNU15VnRZWi9pSGQ3VWhGcmFNbE9SWEM0UUJpTWFVNFQvRlFL?=
 =?utf-8?B?Ky9NZFd2MkdBSkYrRWFpb3pTNXBDSE1pUU1SSkxnbm9OaEU3TTlrRE9NT2JW?=
 =?utf-8?B?cUpjVWRxT1ZwVVlpbXluSUxtd2k2ZHRBYUVOQkVOaTNpZTdtNVlOaHNWSmpj?=
 =?utf-8?B?bGVub1IvSDVpYmZNMy9CRUhYcjFqRDRKbUlZZkpETXdTaGtlU1crQVMzbnpZ?=
 =?utf-8?B?eXZ6RDlNc0kweDJ0K1A4cVFkYjQ5UXp4UXRHcGlLQ0dGM2hZenZ6cmhrNVBZ?=
 =?utf-8?B?SVdzenBScFBlMU53UytERjM0dzAvWUVIVlpkT0UxVFY4WE95TUY3UFUxdk54?=
 =?utf-8?B?WnFXQ09mbjIyN3JUY3R1TlVWOXMrem1TZGtrS2krWVJob2lOcnpJOUpOZERq?=
 =?utf-8?B?SmZHamdabW4wdll1VmpZMzdXQWtOZFZ1SXMrazVlSGN1cXVTMUZ3V1RyNHU0?=
 =?utf-8?B?TzVKU2FSOTBLc205clN5L2VncmZINDc0ejVtUkNIM2JONy9oYno2NnNWRWtu?=
 =?utf-8?B?Y0RlLzRORlc2amlqZDNVL2Z5WTVtZ08wbmI5cWp5a2loMmw0NzZWREhvSHY3?=
 =?utf-8?B?L2VsQmtsWnF1S0hBQ2VFS2hhbUxQOTdZK3VacE5RM0UyUmZsZjJHWktXUEVZ?=
 =?utf-8?B?TitGSllvY2VWTEY5WG1YYzduckt4RHZrQzdIREJYcHlkZlJDQnBiMWMwbzJE?=
 =?utf-8?B?WGU3cUtCN0lOcmlpeWJmQlNKTU9KcWNQcjNTMk9OWDRHQngyL05vQytnSlN1?=
 =?utf-8?B?MGhwU1p5bGNUSmUwdi9DYUlidUlyUEVQUzl4ZnlmVWQrbFFGNGxPUUZYWHpq?=
 =?utf-8?B?c1U5bXE4YWlQOTBRQ0h2Z05HZzV0L2ZmNXBJYWd5SFQySVNMZzdpUmlIUE9I?=
 =?utf-8?B?SGJhOTZIMlVRYlE3dkRxSzVQVXlCazhPdEtoamtOR1VXangwTC9wRkJsTysx?=
 =?utf-8?B?OExUaE5qVmJkMWtxSm5zRHJtVXdSZS9ES055TjIxeDd0MDIzT1ViZ1VDYkRY?=
 =?utf-8?B?cjRGK1NIVGVibU9JeEhldnZGblhiaytFZUZDSGRwWld6eG9aUVNYTWdaRjdm?=
 =?utf-8?B?SFptM0F0c1AvUFF1V29xcXU4cG5YdG5sK1FLanFhNFRFWG1lcml3ZUVwellO?=
 =?utf-8?B?Q1ZocE1QTEtyY0FBRWE4YVZSM1AwbUdrWkVBSkJSQmNRamRJR0lpSVJBVTRU?=
 =?utf-8?B?TkZvWUdESzYvc1VSdjg1Z3phMFZuTVRtcmVUMFVuT2NUeDhXU2RZekpYd3lk?=
 =?utf-8?B?VjFzV0JFV1gzbmVsS2o0N1k0STFlWjdwOUc2b3UxZjFFU212aTljVi9SKy9T?=
 =?utf-8?B?NEVrTVVEWE50ZFpBSXVmeHEzQTNTMFF4elJHMmk2RUI4dmxzMlFuK3haWW1q?=
 =?utf-8?B?TWVCaDNrZ3RMcHFKK1E0WXZNWktHYnR3VHVNTHNjMjJhNzEzdVBsS1FSM0Yr?=
 =?utf-8?B?SFNoUHNZS1RnMlg2YStiUXJPWldOWlJoenl6R2FoZE94bTJIN3FvUnNrTG5E?=
 =?utf-8?B?THVDUml1eWZyekhrUVN2Zzd3SVYzdjd2bkVLamNRa1ZiWEdXMG43bUNKbzNu?=
 =?utf-8?B?R05mMnpmekxiS0JaTjdCU0tqQVdXMkRRemJteTRrZFVyT3J3c0xybkJZUFdk?=
 =?utf-8?B?Q1M3emlQOWJqNnJBVm1kTVd4WFVRdFkyMVhYdmh0ZllMY2Y3RE81a2NaQ0pX?=
 =?utf-8?B?Q0lUMTFlck9TaHNrajgrdGVrTXlrdVV3cDJtVzVvQURTVC81aHdYUUQrWmZq?=
 =?utf-8?B?U2swYkRnS09RaTFqQWEwYWlDSGtMYnlnTk5paFlRbWh5YXQ3NDZ4aGhpeits?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0ZsJ1PQtFAnl9YYLI6XJPZfL75PcBd1w5hhLVGtsrSGVXF07x/AX+auLbVO7V9ctYJs9gWxsl+0hqa/ivQzqmELDokWVWMCyZuX0E7ao9on/WV6bXWnzE5B6TOtuBZmWqi8NsWsmTclUN2uzOV9lEW0CLc7+qx1Vcm0xIp7oyVnONMfjAyFg2Enty9Wyl1HDO0qYqN2XAZruXQvFKcW92LRA1SuTWfQFrzBiHTFz+a0IJXEBCwgBfczdA6CociBjAtJ38eKVRX0ZmLEP0QFUF2jl9nHUzgvsumDtSZGhTV9F2IlVOcqxdpOaJcBhLyF4zRbRkLhtLcZnQdfsdWeOEcP7wgpfkzRgWnxmcoGMpNUKXgy5rgIg1uDMLil5nbq+EMUehmKjLOPuFIGyez9IDj5vDOcUHB2vMpLBMY9C89+UaTo6BXtESTXtTK/iu8brxtLrWqm2CscKVyH+0fdV5A7DZMieQLDeXJlPtk8LkIH48vUZr7PJbpfx6Er84CTe5qq1nGwyqXFYB8ooERrgxYTVujLVLNEcms+ENLIS43iDHC5K4OSr4nAaAxOjn8SJnBkjh0d3Iq7HUwlBR+5HNOWXU+GUNsbKw3qT/TYNbQY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3627798f-bc87-49d3-9278-08dd13f7c1ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 00:08:18.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9S/1+XTiOd0jU9xwoj5H1iRnNCataVaR9qD9frgJ5Q7hH5tEK2TRXVIzNzP7C0d5/X/dqJNpLRe/B/4re1TFkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8083
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_12,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412040000
X-Proofpoint-ORIG-GUID: ch28en-eOSKdumyHbPjL31ccfYygb05S
X-Proofpoint-GUID: ch28en-eOSKdumyHbPjL31ccfYygb05S

On 3 Dec 2024, Eugene Loh via DTrace-devel uttered the following:

> On 12/3/24 15:31, Nick Alcock wrote:
>
>> On 3 Dec 2024, eugene loh said:
>>
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> The io tests tst.local.sh and tst.wait.sh fail with some frequency,
>>> with error messages like "umount: $iodir: target is busy."
>> Can you just do a umount -l, then? The only caveat is that while this
>> will disconnect the mount from the mount tree immediately, the *actual
>> umount* might happen arbitrarily later -- is that a problem?
>
> Maybe?=C2=A0 In test/triggers/doio.sh, you can see what's going on.=C2=A0=
 In essence, we want to flush operations out.=C2=A0 A lazy umount might
> not do that?=C2=A0 I'm not sure.

No, it wouldn't. A simple sync should, though: once it returns, the bios
should have got all the way through the stack, IIRC.

--=20
NULL && (void)
