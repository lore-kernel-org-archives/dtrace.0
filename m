Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399212D661C
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768618462; cv=fail; b=b3nI9WKEU4/3C2dRKx+NdB5ThplBdFbldWfq4pUGfE5vi04GC0K47WKxNDJvr+08IxW0PGhVV2LTTHhsXXl/3Cd/misD2qB7azXPJxYcZ1rNiKGRv1qKZtwU6xMbiuChLvXDTCEC/9x+PvMWqv+N+B97pG4YyjCd7Gz6rFvuuAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768618462; c=relaxed/simple;
	bh=tzRfizEFwebJ1knApTCrbILHaUJUyFx7y16cQOBqThA=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fepciVh7l6W7K7pYc9EdUSyGEOka1XLYO2RlGyEuhoEcIYV0y55zjQ6eZZLsYN+L8t1uffLX1VBaq0+nrA/ASr8qdFHQmfApKFLK7JTG/B6ZG3G79o0cEBZWEUsWf5hssh6e0QhmFSrluz88qna+hxyWzQ9YnqsR/lX+nHpqFQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Toc3p4yh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vk1QwVBQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Toc3p4yh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vk1QwVBQ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H1af1L213639
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=A9JOlWXgaKAUk6zJKi7orjhy1GCo3YT1ULkxS7su6GQ=; b=
	Toc3p4yhv849NXLrGIVQ90rm7aEk6VQS8VumZ2noRTt0P4OXkaqxO/9sqcdGL3nb
	ojZmPgdbQc986IV8o7oKeCkPXWhNE57n+IgldYYOwAknlb+X2Bn4llyddyVyB0v9
	Hjh2dstuc3OdnMG/oMU0jxUs9HCflhncqqX2pfyDeFG/H4noVV9aCk2gBmwtjGWM
	XcO+EkHoumIygawZLODzz541qMecpfThyX83Z82MG38Zl2K7IilBk9kjkQzrkhVM
	KlhyXj2ENfB7lZqkIuP2qYmGMQimj2dzsQEi3eggn9xDRl+5SxARK2GXqmU6Z//G
	0uXl7H9h6uqbpd4Z6rvQfQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br0u9g1qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:54:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60H1Xv1H040602
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:54:18 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0va1je0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:54:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGPVgm9LVr8SjcQzpIm5SqasQ55j3C6iPe+W0cGsGAzcV7odcqMCqwtxqUWLQWha5qWlEkPLZULYHTFimX5DyuR4U3OY+RGm+6ueLtOp6IMZ8fsOtspqzU20QBa4Ys4BsfgTAZhGfYJYatc/emY99WgQZzlFh3NVyAL9nQ+UopTOMzt249ZIG4RKSucPSGNCN9PSHUVLkPXPauQ+e2S7vFIz3B9DEBFzw6Li7Z+/I5gogE6vnIkHk0lOxXX0hfKoJkQxGVJUGg0EdkmHlrHwBxphNQptq1JwcjQkrjS3Ry97FYAIbWFXzfYXcbnoOXxPNYq0o7nSdmzP8bCB27g9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9JOlWXgaKAUk6zJKi7orjhy1GCo3YT1ULkxS7su6GQ=;
 b=QUkE/hQ95E0thHXxbyGyxQqDHUmAZ5/m4xcovDPZUYC9tfalq6SNlv3DfQu1OsnNFOpzJrH9+JNU5FnVyxuHkAE1giF9hEatQ/7cxr2pmWKo8HOv12FcetuA+ET5TwBoBTP4cp7B1MNl59tJN+md8UjK9YY2gZT0fDqCIdHdPt91HN9Cm12bxRO0Rgxfse4JBnhIzeuo8oA7LhDVmM32MFldoSYzk+OILZqxJVFPFDrHEwR3J8CqTaKvvwnrPwbZ3iOo32ELcl7CRG5gubJaeTlR4L/7sHQJREl88zr9aXBw2WBM8aygEXDm+SdeVqc5hb6ac+bxGjaWIM4sVDOXNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9JOlWXgaKAUk6zJKi7orjhy1GCo3YT1ULkxS7su6GQ=;
 b=vk1QwVBQIZxZgpPTBcOeJ5mVQhW5pGbkT4vY3vkBkMR2ryJxLUovXaug2hhHmJlrF9MT85BqmOWyiKqHtj3oc9vUTzzH/lqSBRevd1k7VpgB9GqkYFnx9XkNn6N4hnNWHULYgvBixwkj0gYPQk+6MXBsnx/ysF8a+MFClSjDTvs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5153.namprd10.prod.outlook.com (2603:10b6:208:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Sat, 17 Jan
 2026 02:54:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 02:54:14 +0000
Message-ID: <867117ca-0aa9-f00a-e3ec-4a489cc09198@oracle.com>
Date: Fri, 16 Jan 2026 21:54:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: expected results files should not be executable
 scripts
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev
References: <DS0PR10MB7522AE1AEEB271BE04A500FCC28DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <c46a502a-bb1b-b85f-091d-9dd7814d7ad5@oracle.com>
In-Reply-To: <c46a502a-bb1b-b85f-091d-9dd7814d7ad5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d4a9d8-f9c2-4bf1-a095-08de5573b2aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MllEOVQzUjByTUphTk9RQkFuMXduZ0lvdFJDREVLVEJzN1JzcG1sSUQySVAw?=
 =?utf-8?B?OFkwdnBHNkJJVVNDT0xhZlF0S2JmZ2hUWGxrMElNbkl2RFo2S3M3WHhNL3NH?=
 =?utf-8?B?SThSVmVYVE5HbDl5WEtBdnpJYUFncHVBenFvMzhnemM3cGJNa1YrUitVdHlZ?=
 =?utf-8?B?M3h3ME9FTzhNT1BHRVlqcEZ1L2hPdjExdVBoanJPai9Ta21yaXRYcUZiYlAr?=
 =?utf-8?B?M09oRmF4MTZvTmQyTkdhSCs3RkdPSjdsYUdtMURVcHpCSit3WS81SktON3Qx?=
 =?utf-8?B?Uy83N2t2a2ovSU1UbmppR1VJSGtFWHZuZ2lDaGQxZnJiQ2ZUNVRJV3gxdzdp?=
 =?utf-8?B?V3J6WkdvUnM2cHlucGpEZ3Bhamx3NERYWmJqUzlLa3dzZmU3L1dwR3czTEF3?=
 =?utf-8?B?ZzNiKytHTjNRbmRIY3VPMTVRcVYvMzlwU0NObzFaWFI3d3BrZFFEdkthTzg4?=
 =?utf-8?B?bG43SjVleElZd3VCdEdHV3NsSGE0V0JYS29TdHdnVFRNNjViZ0NGemdYaXEx?=
 =?utf-8?B?TEM2eVBwYjRxUjJGT0JhVVFlbUoxSGliRGI3MlJnbjBPWGEyUlB6L05aakFp?=
 =?utf-8?B?aXlsU0RSUWZXV3JlRzNnWWY4Sm5TeWhTK3lobjhnUm5yQ3RZRjNDNlZUTWQv?=
 =?utf-8?B?NEhndzU1STZYOFp4d1RDK0V4TjI3d0VCdWRrWlpjWmhBMmFoc0FXM0RFZW5K?=
 =?utf-8?B?b09MZ0lhSGp3QjBTYytVTXhCS0pMZWhOOEVsU0k1a2E3bi9vT2txbTVjd28w?=
 =?utf-8?B?dDFYalNpMTFTbmI1V1RTOS81N1RHRWUxcVNvUWxqTjV0ZnJzb1ErK1NXV2Vm?=
 =?utf-8?B?VjRVcnZsUkFaK3ZIVDRpNmhpZ1FvcVNPNVF0VWNZWUpvOWZ1VEp4bVJDb2VV?=
 =?utf-8?B?dFdtbHhWd0RNMEpLL3R0VEhlYm9WKzhpcW1hVnVBczhaU1R2L0lPZFpwN3JI?=
 =?utf-8?B?NGNveXNvN09vWklJaGRML2lEOEZWbHRtWWFrRDJWOURaNldueWdMMXdpYzRq?=
 =?utf-8?B?dkpWaUlUNkhQaWhrTTVkYk92L3VSMjFhNDZpY2xJcDRxZjltWWxaczJLc3pm?=
 =?utf-8?B?YTBHRlBjRHY5dkNyQlNWZDdMYllJSmVuZmN6SElUR21tbTEvN0N3ZXI1S3dH?=
 =?utf-8?B?VU5QNlFRNTdRdnhxQ3ZQci9RL2lvSnA4N3NXeEMvR1UzUTFtcnNNd0JNaUFl?=
 =?utf-8?B?U2x0N0cvbjJqVG4vMThSTjhMYVZ0dHJyTDZycGUzMTAzRWFObGpTMjdOYzVu?=
 =?utf-8?B?SjA3elFYd08xcURnblZNeGFyS1BZWHVHb0x1Q2VtblF6a1IvajJYb3ppVElK?=
 =?utf-8?B?M1JhOHpSejA5MmdUendKVGRCQnNGRWEySlFqSHlzd1VwbVFFRWRLRjMvZ0Ri?=
 =?utf-8?B?YXNubHREVDNQMHZTZEJhL1dDMlp1VkxsdEdBZWF6aGhlWjFMUGE4cGF4ek0y?=
 =?utf-8?B?U0MvZTZIQlBScGlQWWlDSm9aay9IbWJrdWFoSFVHMG1wYTZWTVhkRmZ3RkJq?=
 =?utf-8?B?cXhBcjJKbVhOZXhGdlRmZXB3bG5scEpwRW0yL1I1NEJuUHJFeVBubU1xTDJs?=
 =?utf-8?B?TkJ4bmsvTlRhMzhwb1dXUUExYlA4ZzJGdHFTbzBIV2FvRWRWQnlHQkh6cGY0?=
 =?utf-8?B?Um9kOHp1MitiWUJ6OGtGMjNzYnJmRnBjMkJ1MmxzZ0lIeWlSYzJOS2cvaUpP?=
 =?utf-8?B?c0VVbklDRXcyYmFoNnF3OWpqSEJxeDBiNTU2dXNjMjRkY2J1S0hvQnA4SGwz?=
 =?utf-8?B?c3NUK3lYaXhadHhtRGU3WjBNOGlYT2w1R2ZDMUlHbGgrMEVuMjY2cGZRTGp1?=
 =?utf-8?B?c1g2SXdDNEIvOHZZZ1ZZd1N4U3B2a3dPSVBESEFtR2xTb3JKTUxqWlBBSVQy?=
 =?utf-8?B?b2tOQnpjaU1KWndWKzhkSnJtdkxSQWt3RGJmNEdTWnRRaHZsOXJ0YktWd2JS?=
 =?utf-8?B?VnFRYkFXWHc2ZUdCd0o2ZFN3N1daQVRXdTVzcWZhNEsyTTg1ZWlVOStSVDlF?=
 =?utf-8?B?eTEwS1J4MmVyM3IrWkdCMDFPV21QSWkwa2NLU2J3SW10WEN3TVAxYlpPdXB3?=
 =?utf-8?B?QmViaHlkM0NLMWpBRURKQ3BOTHFxR1ZOR0lzbHhwdGthVVlZeVkxUm9PQUFT?=
 =?utf-8?Q?WEVCHktUj57p8W/Dk8dBdqUeV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEJGT2VEV1J3TmhJSDI1aDlPUWl1L1JJVWg2Z040eFlheUxoeUNDTWpFNXl5?=
 =?utf-8?B?cG1zaDJ6TDRNTGNtSExRRXBVZFZwTE1FMXlVRHJJNWJkbjB3S0pMYUxqY0pS?=
 =?utf-8?B?QzEzZFFyVGd2bWJiN0NYaGRWQlJwd2Q4RG1DV2FEamFBaFVsMXhrUktNR0xq?=
 =?utf-8?B?TDZ1U2tTVXl0SHM2WVhzZTc1OXlhbzNrYml3M3FvRnd0bk45V0pQY2lxcmVZ?=
 =?utf-8?B?aEU5Zm5xZnlWZUhOamdaR3dNelgxNWlGbXp0aFk5TkpEYjdtUUZ0bGNlNHVP?=
 =?utf-8?B?elMzeFVqeEhvdy93WEd6Yk0vS1dsZk9ySzdiMFhweE5Lek45eFU4aFdOYWxZ?=
 =?utf-8?B?b2prWWpPSGFHenY5VUtFeTd5YlB6TzhCbm5TVXpORFJtZTQ3RG9RdjAyUVdx?=
 =?utf-8?B?WmdFTFlqUHFnWmNMbzYvR1BNcGdneU1XWFoyRUhQc01wQ0puZ2N3L3pJUzQz?=
 =?utf-8?B?VlVhVDM4TmhKVmdkTUN5Nzl3bjNsTTJwaU8xb21LUEQyN0VzMWRrUjEzQVFC?=
 =?utf-8?B?d2FTalFzeW1ZVlFmZ3hjTkRBblp5bHRBdzhJelBHVExpU01EVW5nMGJPSWYv?=
 =?utf-8?B?SDkrRFMrUnpwc2JRTURoNkY0YjQ3WDBlZXpYdzVrWXBmazNjZTN0NktOc1VC?=
 =?utf-8?B?RTlnUmdPUkkyOEllRi8zS1YxZFNMN05pWXdLV2R1OWNvTFFqMlJpNm1BL0Nr?=
 =?utf-8?B?Lyt5WXdybkxUK0hHOVM1SkhFelRRenpaSUlZYjRabytubVFkN29OdFFLRDAv?=
 =?utf-8?B?SWdJOGlCc0dZTGlTMnMwTkt4eVNjY0hkODVXRXpvVGdvWEFYY3k3TStpZkkz?=
 =?utf-8?B?MWNGWHdUVHdVdnZMWGtHNC9LVDV2MzEvV1crNXVaMzlJaFA1OUZYZm9uSjRv?=
 =?utf-8?B?Tnl5MG5IMy9DeUROamxMeEhlbHN3and6bXRERkN0Qzk5SmFSQnAyWWpZWGxB?=
 =?utf-8?B?dDdhemd4Q0lSbXpGcDVlZDZ5SFFKTWdCZGJWRTlhckJ6T1NkV203N3dySXZk?=
 =?utf-8?B?clpVSURxSUl6alcrYUc5Vm03QlFoRW1Fei8zS1Eyc1VNTVNhQkZRdnhYSjVR?=
 =?utf-8?B?eEsvZ09EMklNNzN6WmJqYUVnUVZmODhMSUxiTFRIdHFzRTlXRjBqd0RSRnlD?=
 =?utf-8?B?YjNWalJMSGFHNlBzc3hNZXdvU3djZS9HVmpRT1RDV0o4MWp2UFNXU1JLL0cw?=
 =?utf-8?B?dm1JTFg4L2hNb3pVTHpmMTgwRDA2WCtlVUNNWkc5MjRNUktDVzBYdWpXTUZ0?=
 =?utf-8?B?RDBpUk4rc0RRUkJnVDVvMFVvWndRUWNYaU05VlEyQnR1U3lNYUx6bWlpeUZw?=
 =?utf-8?B?SWNLSkUvNnRxWnlpWUZMbmtFUlIyUm1IelJ4eFc2OXpCSk5ZeCtqZlpzaGh2?=
 =?utf-8?B?ZEJEQ3VCYWdGcDMxM091Q0lBdmpZMHNUNktGWU1iSTNKQ1Ayd2hRSUJWU1JN?=
 =?utf-8?B?THZlMzBtTzA1RHVQd082Q2ZwTGpxV1Z3QzRMRms0NTd2bTlvRzBaMGhNc3ds?=
 =?utf-8?B?WmxJOE5LY1hKbUc0VnR0b0tnSUx4ZGgvR1RhVTBobXNGVVU0aHg3bGZrQW44?=
 =?utf-8?B?ZTVsZzRUV3kwbUFGaDVhTEhMNm9iQUM3WkI5NWRYWk1MVENSSktRRWw4Zzk5?=
 =?utf-8?B?Rk9lMU9uK3psV1VRVTRveGNCczV2NGV5Y3UzWEU1REpGSkZvMDNWdGVudWV2?=
 =?utf-8?B?eUFoTVBlQVV5SmllMkU5azlLc3BCVG0wMzRNc3FrZGdJMlh1eW11VkM4YkpJ?=
 =?utf-8?B?UFFuKzJNMzVzUXNxZDNWTUZwdS9ieFRSV3VMbHVWRFdUOFBUTGFUOUVoNDd3?=
 =?utf-8?B?ZWUrcEw4Y0IvNkFCdXlCMVhwUEoyd1M3bkxtbEdsUHF3ZS9PcmllN0hzTGV1?=
 =?utf-8?B?QXZ0ek1FTWE3UWR0bmZYZm5kVFArK1pSdDJrUTBYSGZhZFl1ZnpETGVCWmNN?=
 =?utf-8?B?NzAxcmlBcVQ2TXowN3oraTlMR3I3Yi9sdW9FTGZpcTVVWE4ybXZVVjVzdExT?=
 =?utf-8?B?MjNrOTRnWWhnazFLbTlsYkY0MVRSZ24rK3lWME4wRk1QeGhDUEF6dVZ0bXEx?=
 =?utf-8?B?c21EaHgyQWphRXBaOWNmQWZPUUl2ZTdjTXl3ZTdJUFZFQUdqWngxR0VKcCtR?=
 =?utf-8?B?dTRpZ05XalAzNnk3OWxYZEdTL0tMTzBEc1JFcjMxeEJzVUlURjVsZGZoVkIy?=
 =?utf-8?B?VytiditaK2loRWR0dW9iUEQ0Z3FCbldzUGRmRUIySlBwaGZCZG16TzlxSFlw?=
 =?utf-8?B?djBOeEVEZExLb0UxYkRrc04wY1YvYThKVkN5dnRNL0dNZis4N0N4TUJubXo1?=
 =?utf-8?B?MHhiM0tSN2VVU1FtZDlnSEpBT3dCR09YV0oxdW5JTXpYd1JmRFdoUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iLJWjw0roAMF7oRvPs2uBC3C8JxQgmGeije40JQtC6blml2ZDRBfPLtMpK0Pg1kRTqH++gGAl9ttN88OzQkewgl/bp/Az7PDYyQ49ZWSkqAyd2pafvTBHTN1AA66q+rUZD4l4wwlI2QYvcY7U+fvyWRXB9RUU6JqTmig0kDrsfyGlhTpVdOIeLQ4xd6GiYt5FriPxwcoGnJYwtZNXv+UBx1wr3F4gZk8XtiMc67ZMd8r2AD9Hr1JwPy5cKFzmKMMs6hiwMWmteR1WfsiBEiUrL9PDxfXbEh1PgL45pkCHB9OnoUfNFhjWGEhXfhLAbLeuJOlHFywlvNSJxpzOSoAwfUd4AnM/xUDmB5WwtSQDorlB/OeQYy2viQW3Ql5mg6CJ8FkBZqkPZgamA13rDURDUyZ9NLZrqPxPEZgRR9JzIYKyQL8epu2pqmcHxcey+k4Z+2zmUQUE+NAVExsytgE64eaO3oIeqwaXz54g/H+Vwg4X9MA/tBOD9btBK7A2FHAIspVf7tGlTeNH8kehdwoV+F9DETvBVsPAGimHZ8fHdOO4Ymj1mzWwn+rsfquojBHk4buL4Kj6pJI2fskXvsGZEzOgcCeRgCTNs0XNNWwZTw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d4a9d8-f9c2-4bf1-a095-08de5573b2aa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 02:54:14.7090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdoDN1WxjG4warPikKmmz+GHuEm7uwHFnk08gPvsrzAcc7IxXNHUONkZlN3xT2BIyhXFD2/u/mh3Wghz48xTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601170023
X-Authority-Analysis: v=2.4 cv=OJUqHCaB c=1 sm=1 tr=0 ts=696af9da b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=jyg9GLj3UiarEj1VDbwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12110
X-Proofpoint-GUID: 1Apj-tgzS_AEiBjZfHov2kLGC7XG7SZx
X-Proofpoint-ORIG-GUID: 1Apj-tgzS_AEiBjZfHov2kLGC7XG7SZx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDAyMiBTYWx0ZWRfX9mWpgn2besrC
 dup0TpT1zLIpA26p3BdCbtXnOxd5zvHX/hjl1YtKYBXk7FlUboQYBSDutd4Od71mUh+4+kSvSnY
 L0Dr0YrfeYJJTj797S5TqFZsYaStPXvgli07POQ3QNOM/LKapIfAVPBDIs1x8jAhYr4NfNSzyen
 z6+ovbsp/zg+cn/d+tHAZIWuX0ww0i6mHyloKQ2SKuPRO/LK3bGKE0NP8iwTlIe9nE9v8BTyVI1
 bx7Zf8K6XhK+NBdeG3rj+QrpirKu3n3o9+L62DGi+aAB5YK+Ly+futkMf8rfVX47CR9sy98nWY6
 iy1Xd4WxNX644ofcRDQlE+27E0A12SD3PnO0P/wDa9nZhxDvyAgPOK0HWqymxCCqxQV6RxSp+jk
 JjcSvAQhxymfE1RrIN3+qP7Q6f/uJkuI1hjpNFkuYAsudrVumZgPXT32UbBsDiGQu568Xc+9lXA
 OrXW+PrsDpEhv9Hhy+jtx5kLckUCa5Wdtfs2hrKA=

I also meant to mention the typos in the commit msg:
"Tthese" -> "These"
"ot" -> "to"
"do not emit..." -> (something)

On 1/16/26 21:06, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> Do tst.substr.d and tst.index.d need updated Copyright notices?
>
> On 1/16/26 18:11, Kris Van Hees wrote:
>> Tthese tests generated a bash or perl script as output, but given that
>> the associated .r files are not meant ot be executable, do not emit a
>> that looks like a script is not executable.
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   test/unittest/funcs/substr/tst.substr.d | 2 +-
>>   test/unittest/funcs/substr/tst.substr.r | 2 --
>>   test/unittest/funcs/tst.basename.d      | 4 +---
>>   test/unittest/funcs/tst.basename.r      | 2 --
>>   test/unittest/funcs/tst.index.d         | 2 +-
>>   test/unittest/funcs/tst.index.r         | 2 --
>>   6 files changed, 3 insertions(+), 11 deletions(-)
>>
>> diff --git a/test/unittest/funcs/substr/tst.substr.d 
>> b/test/unittest/funcs/substr/tst.substr.d
>> index 8da15c30..4dcef73b 100644
>> --- a/test/unittest/funcs/substr/tst.substr.d
>> +++ b/test/unittest/funcs/substr/tst.substr.d
>> @@ -153,7 +153,7 @@ BEGIN
>>         end = i;
>>       i = 0;
>> -    printf("#!/usr/bin/perl\n\nBEGIN {\n");
>> +    printf("BEGIN {\n");
>>     }
>>   diff --git a/test/unittest/funcs/substr/tst.substr.r 
>> b/test/unittest/funcs/substr/tst.substr.r
>> index 94d94e74..285b5c19 100644
>> --- a/test/unittest/funcs/substr/tst.substr.r
>> +++ b/test/unittest/funcs/substr/tst.substr.r
>> @@ -1,5 +1,3 @@
>> -#!/usr/bin/perl
>> -
>>   BEGIN {
>>       if (substr("foobarbazbop", 3) ne "barbazbop") {
>>           printf("perl => substr(\"foobarbazbop\", 3) = \"%s\"\n",
>> diff --git a/test/unittest/funcs/tst.basename.d 
>> b/test/unittest/funcs/tst.basename.d
>> index 86d80873..2b3d098a 100644
>> --- a/test/unittest/funcs/tst.basename.d
>> +++ b/test/unittest/funcs/tst.basename.d
>> @@ -1,6 +1,6 @@
>>   /*
>>    * Oracle Linux DTrace.
>> - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All 
>> rights reserved.
>> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All 
>> rights reserved.
>>    * Licensed under the Universal Permissive License v 1.0 as shown at
>>    * http://oss.oracle.com/licenses/upl.
>>    */
>> @@ -38,8 +38,6 @@ BEGIN
>>         end = i;
>>       i = 0;
>> -
>> -    printf("#!/bin/bash\n\n");
>>   }
>>     syscall::ioctl:entry
>> diff --git a/test/unittest/funcs/tst.basename.r 
>> b/test/unittest/funcs/tst.basename.r
>> index 4f3aa0cc..fb68c543 100644
>> --- a/test/unittest/funcs/tst.basename.r
>> +++ b/test/unittest/funcs/tst.basename.r
>> @@ -1,5 +1,3 @@
>> -#!/bin/bash
>> -
>>   if [ `basename "/foo/bar/baz"` != "baz" ]; then
>>       echo "basename(\"/foo/bar/baz\") is \"baz\"; expected 
>> \"`basename "/foo/bar/baz"`"\"
>>   fi
>> diff --git a/test/unittest/funcs/tst.index.d 
>> b/test/unittest/funcs/tst.index.d
>> index aab920eb..a918c386 100644
>> --- a/test/unittest/funcs/tst.index.d
>> +++ b/test/unittest/funcs/tst.index.d
>> @@ -60,7 +60,7 @@ BEGIN
>>       i++;
>>         end = j = k = 0;
>> -    printf("#!/usr/bin/perl\n\nBEGIN {\n");
>> +    printf("BEGIN {\n");
>>   }
>>     tick-1ms
>> diff --git a/test/unittest/funcs/tst.index.r 
>> b/test/unittest/funcs/tst.index.r
>> index 40f360fe..4eaa081c 100644
>> --- a/test/unittest/funcs/tst.index.r
>> +++ b/test/unittest/funcs/tst.index.r
>> @@ -1,5 +1,3 @@
>> -#!/usr/bin/perl
>> -
>>   BEGIN {
>>       if (index("foobarbaz", "barbaz") != 3) {
>>           printf("perl => index(\"foobarbaz\", \"barbaz\") = %d\n",
