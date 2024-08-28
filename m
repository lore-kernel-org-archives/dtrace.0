Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA081A4F0A
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875899; cv=fail; b=crgnDQ13fMETGRj+detMTyXEmBMaAwm9fzSWuAS4DUowVZwgD8sNlql2g6cLZmnTzI1ZvIaa9FWDz2e+4KlWKJKUP+KKtNs/3MNKFZ0wVFM8ZeY1tFaqFWbCtygKWF1P8FQhiaNv7ii+Su/g3RBMQImBNQWflmiEYJVmdmZ0RS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875899; c=relaxed/simple;
	bh=njWxYM1zJVV/cY7C2oct3s0A41xBTfwxfNpA8N+BqD8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QI7EIpG9p+N3OMepgQ3Sqo+VVeL36rNlQ3MBeRECiJzeiWuQFXwwNy2LozBmFaXeOpD//755Ijtlya95oa6OKqY93h415wHdZsaDQh6ZPfyGmjBOxpcF7Cw829tdy6q4WZ8xTyEPXfd3fBATjBKT/rF/1tTR5RrhFJhQ2HNdddI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F5mw4ctb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dTi6THTU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F5mw4ctb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dTi6THTU"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJYFsH015542
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=2+CvRAKFg1yfPfXRhVX2WKXVzfng097DCKd3w+TWNrs=; b=
	F5mw4ctb6XKur0eBEYaX+BenB/D/DbNQ+Eqf2qqg8WJt8YgnErojDY8hAjsRErrx
	Fwg4Jbdz8Rt1rqTPCAvfkcpIlH/DGIhPQjrP1clEIXuBEAJDcE6a5w7NesqRnn2X
	sIl0uhldkVIxthgWuQ5ffsD78PTgI/MBKIcO+Huy51a6WBAVKMOqI/SGN0ffVVyq
	aYA3x+yQH2hnRk/XUivztNFhW1iVOhBe+Gc/MpGj5zs+yNG5MBfqmSrEGGeG7MSE
	LD8siW0S+JNJvSikKrOdb+/mCcNx0zBQFoq4nLhD3Hi7SHL1liw4pUcFPmfcnED4
	+sc/etWi9NtFSQpWpY8iOg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugt9aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:11:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJrQ8i010223
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:11:34 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894ptht2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laQ0QpqPWHhuAnDZjPdhpKCs8/7sBekn2YDjHoeDEaU+sBaWZtq/XkgRmEqTRQ3qr2fWLILM9jyHNF2YwqawwM+S231+WpibBs54jFXe/DYauKzTnLEB04PQIIPpgsddvHREes6YtIsMacO+bX0FuLWIgmL6OUIIZcXmAHG0xVx+4i4hHTv1sSCleVp4v7I0qYV1z8uZej7/ARGetW2sud3/OvJwST04SVssY8UGdvS3P3xYW8ySJrSpZAerl/94ktFGZJomhTxNjEWx7zt7kKLS1p6a0nXGLuaCsD1Q3o26I/8OT5nqecEjkfM4JjKEwJA00hCKdu6gE5HBm3gKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+CvRAKFg1yfPfXRhVX2WKXVzfng097DCKd3w+TWNrs=;
 b=PBCU2vu3tSU9SC+MrvgilGjfnqw67lbYPhgVlyT2xG3NlQQuuMudVSB6uKFC1gcCDbrhCpCRLpkPIYmSWwbwTZkCS/8rO+Am9c+5SLbjEtTCr+E1iggv2pPBvh8m+VvmRBthbtSbcRBV+/ikqkSBB2tnw4ayOwsmEAEyVluYk6sbT08l88lcZXtFg2pxXxRmcF6H4BpVLop6blBqIknqQNBVtU+DRFpklPfx6Fv3wSoEz0Tu9TX6vmGLsc2gSqeYoVBs8Ci2LHY6Qo4qmk8IwQP295zEt4luStF/AaPAPZ6/RqzbFSM3AV0/qWeMQmLbo3yTPHodUOBGRdjIFgsdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+CvRAKFg1yfPfXRhVX2WKXVzfng097DCKd3w+TWNrs=;
 b=dTi6THTUbe1tKvMj+po5l0mjHIA9ECekW9m2Rc8H7sH+3dj15e4IAbTLt3SnhwZxx+bEdTwrXNzJyw4ucwcy9Pmyl+B1TC/j8cd2e38N9VR5Wn+dpBm6J3FnDBKMb5oAdZsPTppd6S250UdK+lEbaNA42UkMAvEj+EMIjSAYsPo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7932.namprd10.prod.outlook.com (2603:10b6:610:1ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.17; Wed, 28 Aug
 2024 20:11:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 20:11:30 +0000
Message-ID: <4098cfc6-ce97-e8e4-28c6-b5306c23e51f@oracle.com>
Date: Wed, 28 Aug 2024 16:11:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/8] Reduce stack depth if kernel returns
 NULL frames
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-2-eugene.loh@oracle.com> <ZsPVqitlZpZp2lcA@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZsPVqitlZpZp2lcA@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bab454-ddda-4ed4-adb4-08dcc79d9b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGxkeUlROWdDbFdCVVpadW9PekV2Z0h0ZFpPcDlVY2pBdEw5bER6UDJ3QTZh?=
 =?utf-8?B?aDI1c09IMzZRakdxdkVpUXgvSmZNLzdmQURZNDVtMTMreGV6R3JMa0FtR0Nn?=
 =?utf-8?B?ZW92aTdJSG55M3dLR2t5UGRnUy9BeHR0OTJYU2hEMGpRQ2JVSFRSdXM1cjR3?=
 =?utf-8?B?bjlDQXNLVnFPdEdyUHdDdkI4ZkhCU3JmTmFBTGxIcUtaM1RhM3pYUGtGR3J1?=
 =?utf-8?B?S1pEelZiZzRZclViYlRsK0JScm0xQjFMaDljWk9GbTVyYTdBRzloZ3FXR0Jm?=
 =?utf-8?B?L2l0dXVuUVR5RHJnQnRyNy9SYi9UcWpYM0JIUmlUaU9oUUZVdHdibVJRcUp2?=
 =?utf-8?B?Q3NsdnYrWVlGeEsyVXRDZk13ZjM0ZWVJQ2ZaMEVsR3ZNNWJuVjd1elhHa3Fy?=
 =?utf-8?B?ZEMwZUMxTHJUR0NDdmVBY2ZyaE9WK0dyWlNoeVZHbUFFS0J1OC9DclRsYWNH?=
 =?utf-8?B?Qjd0dGMxU3hPL0praTJybU1KcG9pWXBiNnR6Tm1tdW12VVdZZ2FDOXdhaWxD?=
 =?utf-8?B?TkhZVS8rQnZzQnpNc2tHdVVCb1g4MUtXaEZ5TjJCTElWZ1NwMDlVSVBkRW1k?=
 =?utf-8?B?K3ZhdWNSZXJKYnNIdkpUMDh0djRpUUtqZ2d5SWdJYnpIRFhqcEdQcUxXQXIr?=
 =?utf-8?B?emxNc0xTbkVPbFhMOURDUnlmVDRlZ21yUjVVUnZzVUtiZzcwellwUmRGOEhC?=
 =?utf-8?B?ejdGR1FWdVBkaHRSbFJreTFPd0dRNmVlWTNXZFdVWGtReDVzMHFhMHZHbWpV?=
 =?utf-8?B?OE1jdnZRNHpNOTNHWnRXbTMwWUxGVFo4SmdiNXN6bUlZRlhUWUtxUVFlOGRP?=
 =?utf-8?B?RTNlNE9kWm5TblpHMnpYZ1A3UUFMa3AvMXhYaVM0R2dNRFlSbHoyV2lNM3Ay?=
 =?utf-8?B?VHpzRnRCZEpsdFVDaE42UjZTRkRIL2lvOWxnejJIbmMzbzkySC9uQ2JMcWN1?=
 =?utf-8?B?S2lrY2JrTUhjQ3AzVkNSclZIMXd4eFBES29DU2lWYkpPWXNqUVJDaCtSVkdV?=
 =?utf-8?B?U1VSR2dEc2ZsTkYzVzhXYmdPV2Q5K1lVUzF4UjV2YWlkcHdxZ3N2YkMvNi9W?=
 =?utf-8?B?d2FGVERRYUZzd0hzaCtaUXVtZmFQTFBmR3dQNmlCZ2F2MjRULzJzaEVGTjYy?=
 =?utf-8?B?SnBvVWdpWlluWWZ0RGNVdUovVGI1V1NUWERqMnVXdGlzS1JSb0VPS0ZaajUr?=
 =?utf-8?B?SkpPVzloWktuVWxUZm0rS2ZheXRjMlltalNSbnVQNnR3Tk5ZUm10N3pUUnFv?=
 =?utf-8?B?Vm5BMW5RN0hzOW41dkdVUW54NzRjbmhpNnlCQ2N0TmlYVFJTcmpQVzNkOGtB?=
 =?utf-8?B?YW1yVVZFWWVmOXFlY1g3TktzRmt2NUZVZlhjT1Y0dzZMZGVkaFVCUGRISWhp?=
 =?utf-8?B?YnRLaGkyRzN1eXVCK2pkVTBwKzU4MmdQMjZGZGhJYVJUeFp6ckdST01OY2dv?=
 =?utf-8?B?cnk2ditSZUhpWVBQRmN0a0RKZXMrZ2NwbEJoSjhJVjM0eEFiam5NcmZaTTZW?=
 =?utf-8?B?SEVMK1daWlBEUk9GOVlCOEVHdnpENFQ0QW9GQUhrZk9YNE9hekprMnlaMFRL?=
 =?utf-8?B?Nm9wcHNXdk9WbHVTbjdvZGx1TmFKNWxvYzEvUmQwL3kwRE1hM3VNdzhHSGsw?=
 =?utf-8?B?ZURNdGFEcG1taDlsNlFUMi9iK1FpQzNnRFNRcEcydHlVbkZxSkREYjNoSFRh?=
 =?utf-8?B?VzBhVTJwcTN2cFU4cWgyMUxzMFdaSVdNWWVkZmo5dlZvRStVWi8wVHRsQXpO?=
 =?utf-8?Q?VsKeFQvyeAQIWvkd5M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2NuZFRnUG1NOC9OdjR3TXRWL2l3NEtDcUVYUDlNakdLKzRQUGRLK1FkejZT?=
 =?utf-8?B?RjV5YVZLTHR1R3JDK2JRcnNOSW4wZUFFbklPV3Z6WlZZajFxTGlTWkNhZzZm?=
 =?utf-8?B?aUwyeW5KZUcrNldHVFlHRmZacllWbGdhRWZCSm1VQmp0Q1FMVTJ4UDhpcWUy?=
 =?utf-8?B?VitibW9YNURHaXF2VE1pZ3kwSXBkUGhFSTFoN2cxY091UXpmUjZUZkk4NUdl?=
 =?utf-8?B?bDQ0RFpKd2lyUmttZDdoMC9VVE1qSkY5MWVZdmxSRSs2ZkhjSGZIZDd1V0ZN?=
 =?utf-8?B?cnhZN2JXdm40MExrbmNYam9JaEphaS84N1VONDF0d3AyVmxtbVd2VkJ4dG5O?=
 =?utf-8?B?dmhWclQ3WDc0YlRnWUMrdlRiWkVXc0pCZUpDdU5kcDYzdlN6R0kzTVoxdUhF?=
 =?utf-8?B?SC9YSGNBUk9od2IzcHVIQTZ6SUVJUTFOK2RJbmtNSlp6aHE4R2tvNkdzeFZi?=
 =?utf-8?B?aU8xRDladzBiTXMxOEM4ZzJJS01zTEZOUGRLcGVBWWxyY2dWQ0kvc2hXbUc1?=
 =?utf-8?B?Smw3VFNEWUx4eFJOZDV1WWlFNHk4M0NCRWNxZWVHZzR1THcxUC85eVNaN0x5?=
 =?utf-8?B?WDlyVEJISTg1U1BWZmlvaTdxZVJjZ0psbnhEdDN5R0JKYi8zTFlZa0ZlMStS?=
 =?utf-8?B?TWZmcmp4YTNCYlhJaVhlQW0yaDFBT2FqYXNyOXZTTFpzL2d3dG5aM1pRSHJm?=
 =?utf-8?B?YURYQzR0UkhxajBEb3RaYjBTUm9FOEMyRXhTcmpyeStUakNlYWN6MzZHaTNt?=
 =?utf-8?B?R1c4TzU3ZXhIdFd5TDNZTGVzamFPOXV6YmF3R2syOU9IdSszQXpHZ3FPZysz?=
 =?utf-8?B?WXFCV3VpbG9jQ2dCRlN3ZWk2YzRVYWZoU1l3Zm84TS9LcmkzR3JRc1JDVjcy?=
 =?utf-8?B?bmllYnNMOXJpMkRtUmJrMDRQWkxoZlFIZUY5a0o2ZFhwRU1zME0rbjJOUFBx?=
 =?utf-8?B?QTdtTVdlcHZsLzBiLzhMUEJrUDQ2cVJ6Zm9GL0l1WitFTUFOdjVOM1NZUEtU?=
 =?utf-8?B?RjJidk8xbEJGNVp2TDhqNDl2TlhkYXFVZlRuYU1EODkxUkxpYVFqY0lJKzJp?=
 =?utf-8?B?ZjFrdXRjMXN3dW9NdU5vdUhGVUwzelR3Z051Q3NGME12L0tHVmRncGVMNTdJ?=
 =?utf-8?B?SFpaNWNVTmIzQ2NIclkyN0UrQmswNUt1NWFaYm5DVElpZmVxN0gvckk0SzNZ?=
 =?utf-8?B?cUFsdEpEUmhobFJHeE1weDQ4bTUydXNUUnVkbjNPZVlDQlV6U1pzaTd1dE1H?=
 =?utf-8?B?U2NRUnc1RWlKcmNZWUZGckhLakM5bDIraHBJcjhxNGhMMm9SWXlUVTRsR2wv?=
 =?utf-8?B?SmNwVDA3dUg2OUh5OUpMS1ZINnpzU2JiZFJOVkovQlU4QVRqb1ZqVXBsYmdS?=
 =?utf-8?B?N0Nzb1dNVFRIV0I3dWJCL1pSb1Z0L1YvdVUydVNhMW1lbURjZEI0RlVoTGsx?=
 =?utf-8?B?ZUZJWEZKcVNRYktONFRBbllERWhTQUtYaDJyOTI3Q1dGWFc3a0lWWHVZMG5O?=
 =?utf-8?B?WWU4MDc2UWFNWVE4endXT2gvaXRTcG5wMklCYThxTGxhVDZoaktVL3lyNHdh?=
 =?utf-8?B?cHViT2JpN2ZJOGR6cktsb0svelJuWGNUc3pLeW1kdmFkQlBsWFhrZmFWQkNK?=
 =?utf-8?B?YUtkR2NHTjZLdXdsKzc1YzBFaEdjb1lmcnVWRkhPMHN3WERLTXFDbnFrL01h?=
 =?utf-8?B?R05lRWI4eW5zamRreDVFcWZ3TEdkMVp5cmxVUDE5RldVdU1jL0MrcmNsZmlQ?=
 =?utf-8?B?UktEd0lnKzRwZWxHczFFbjNFUlV1YVBZNUNoaFZsWEI3MnB4cXcxc0ljUi9y?=
 =?utf-8?B?cnJvUE9ybm9KcVVxMkFSZks4NWM1VnJHRWtJVnpQd3grdG5TV1lPNW1iQS9C?=
 =?utf-8?B?MnFSbGpoVUsxOVlmcFc2dGZkZmtDMGZUL3R2WFBaL0dHd2VjMFRoT1RhL01X?=
 =?utf-8?B?R00wSE9kV2F0cklQVkM3WUJHN0JqaXhCNnIzazVlNEVaN3l5SFdudjR1R1Bv?=
 =?utf-8?B?Y1NnUUd0RWdjaDNybFdoeDkzTFlPNlBBZE52Sjl6dmYyQlkxdkRaN0pVaTh3?=
 =?utf-8?B?TzAycnJGUTltOWI1MUg5UnlTUG9VNXRkc3RENHp0QmprNU52WU1XbkdKUmZl?=
 =?utf-8?Q?V1VFHrT8UPtlmfGDsDPtaALTN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wNRfYwLoUJ8z7xwQQCL0RHmMzJbOLn1eDZKvd+eCNCPWp10nUzpF7Vl/JsZlLUJ9zaBZdkAaFKCDM9dtLkspQCSBaqHNB9H1CwGzNVWStYzMrHmbPBXKz0NznXY8xHTAMTLTimjC6hR/CHOLYDPDJFEUB318cClqj3Esy+89oiJEz4l1zPNfkM7ZHD1KAVqUJHtN/wG8rclGCLhA+iDZPijJUw9u+aJvmwHMoykrlFCMbJDVoaF8RYBBaMV8jGOvFQXYCKxCdANnrzBqMMEeCh/lWgoPHcQ5McrKk6mrBj9hAzUfDHKTh5mck2Jpyczzm9cn0KUAbLX4CnFDN3E8dE/89I/KAQOwKX6d9lT6puvfe5xmMwAL1JY73yRi+kSrKO6Ax5MdLuzwvwF5usJR0tbJo4AwH8FcsZoZQDPngh0g5hDWuj2wJEmdrQV4MWBXMxS2OEDafLcIv5VqPGYFnY5Leriac+8s//rJG0DrMJc6905x0lqVrdX9CFPO2qFGccJ1mKfhZFGUktYFq5zrvwlND8eDwxyv7tmNn3TVytuxOMUBFdwIcBtLY7oOUl+yDjshliqIn8lg0Tamjw28DZat+9zvB0m03bzPlzxy1Tw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bab454-ddda-4ed4-adb4-08dcc79d9b05
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:11:30.5574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvM8jIgg4GkuCDipQpP16J+t5De0znxxP9aqeFXSKXjXXSzMuEk0OnPqvoZIaWIoWmulxClje3DI6SkGMHr5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7932
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280146
X-Proofpoint-GUID: kGD8ATizkt8JY7ydl8dM-lrZvzClnVHT
X-Proofpoint-ORIG-GUID: kGD8ATizkt8JY7ydl8dM-lrZvzClnVHT

It's been a while, but if I remember correctly it's actually just the 
other way around.  That is, to make stack and depth consistent, we're 
forced into this "depth reduction" patch.  Put another way, the stack 
simply does not include NULL pointers -- there is no way to remove them.

E.g., let's say we have a buffer of 8 pointers and we ask for the stack 
and get back:

     0xdead 0xbeef 0xfeed 0xface NULL NULL NULL NULL

Looks like 4 pointers.  But we don't count them.  We just use the return 
value from the helper function.  If it tells us "4", then everything is 
consistent.  But for some reason (I haven't looked at the code to figure 
out why), it can be 5 or even 6.  So this patch bumps that value down -- 
to attain the consistency I think you're asking about.

There is a test that exposes the problem (inconsistency between stack 
and depth) and this patch's fix.  Again, the stack already does not have 
NULL pointers, and so it's simply a matter of patching up the depth.  
Unfortunately, the test is riddled with all sorts of problems and I 
haven't yet gotten around to cleaning it up to the point where I can put 
it back.

On 8/19/24 19:30, Kris Van Hees wrote:
> If bpf_get_stack() can give us stacks with NULL pointers at the top, wouldn't
> we need code to remove those (if they need to be removed) from the actual
> stack() data also?  If they are left there, then I would argue that we should
> also include them in the stackdepth count.
>
> On Tue, Jun 04, 2024 at 02:00:02PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The return value from the BPF helper function bpf_get_stack()
>> basically returns the size of the stack returned.  We use this
>> value to report stack depth.
>>
>> Some of the top frames can be NULL, however, leading to some
>> inconsistencies between reported stacks and stack depths.
>>
>> Add some code to reduce the stack depth if one or two top
>> frames are NULL.
>>
>> There is an existing test to check for this problem.  It will
>> appear in a later patch since it has multiple problems.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   bpf/get_bvar.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
>> index ea5dc6b1..a0c04f3a 100644
>> --- a/bpf/get_bvar.c
>> +++ b/bpf/get_bvar.c
>> @@ -67,7 +67,9 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>>   		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
>>   		uint64_t flags;
>>   		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
>> -		uint64_t stacksize;
>> +		int64_t stacksize;
>> +		int64_t topslot;
>> +		uint64_t *pcs = (uint64_t *)buf;
>>   
>>   		if (id == DIF_VAR_USTACKDEPTH)
>>   			flags = BPF_F_USER_STACK;
>> @@ -87,8 +89,19 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>>   		 * what we can retrieve.  But it's also possible that the
>>   		 * buffer was exactly large enough.  So, leave it to the user
>>   		 * to interpret the result.
>> +		 *
>> +		 * The helper function also sometimes returns some empty frames
>> +		 * at the top.  Bump the depth down some so that the stack depth
>> +		 * we report is consistent with the number of frames returned.
>> +		 * Arguably, this should be fixed in the kernel, but we can
>> +		 * work around the problem for now.
>>   		 */
>> -		return stacksize / sizeof(uint64_t);
>> +		topslot = stacksize / sizeof(uint64_t) - 1;
>> +		if (topslot >= 0 && topslot < (bufsiz / sizeof(uint64_t)) && pcs[topslot] == 0)
>> +			topslot--;
>> +		if (topslot >= 0 && topslot < (bufsiz / sizeof(uint64_t)) && pcs[topslot] == 0)
>> +			topslot--;
>> +		return topslot + 1;
>>   	}
>>   	case DIF_VAR_CALLER:
>>   	case DIF_VAR_UCALLER: {
>> -- 
>> 2.18.4
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
