Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095603B840B
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810004; cv=fail; b=fu8T0W9DVnDjzERPUzLzUR6QGjksbamlF+2hqfXgiZARVOeuSaC7FiRjp4gviuWomSu0m+XUMjcpmsDJHXGIJ1jaiKOxDAAYsh80gwzqz8bdP2Lvz6Gt49QKEgQXIRBsJHCwp90RSbGXQmSohHkFbJ4vNFbYFhX+XTQ/qu1eY9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810004; c=relaxed/simple;
	bh=Jr01NQ9WSdAtYAJcCWCutrIrT9jMVhuvj5aSWzhRX/0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EusM6708cFE5CUKUU/4jd3tC3hiwDJzmcUU8878VgOZjI4Oq+YxpvViWbVK+M2xxYUECa/svCN5TheUjwpok+F1bERzR59vTTqOhUC6YXje6175MFAub6QYdtgUPR9NUQqimgmDOwG0Rvl7iivb6/x8oYF9lc5EgfSaq8cui6m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cf2r8aIa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LPwkQpLK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cf2r8aIa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LPwkQpLK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCPRLt854812
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 12:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=E4lWKV0rP4st+jFKwZQLlnaRhdi91tTaemfZMVCFw1E=; b=
	cf2r8aIaOSDppbvv9naAw9oVGx9ZCl6gqMo77FswBJsF0nAiOpZrHs3nCNLjUv0f
	qmTlIGO2IeC3l0buSXAvdzQ3sgppMlshFtkPwz85OCmUawz3uRQHwbap+tkdDmko
	AE31jw91JoWUO7ZnupKw3BcnumVSbevhV4axNPgSd3behP1eQHDrX6MGWjKw3+Q1
	gXGpUb0aFPHDQP8MRfdYddzWR92TsdlTWrJ9rW/OvVEMm1bW37klv3uSWp7fQ2fA
	WYHZ+hWfBpHglW8/aoqDKmr0XOgDTGI8KQqqunuHigBLwp52w7HaL5edtpG5+mxl
	y+BeAliQsI72GooTQfyHPw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1mv6u81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 12:33:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66NCX8MG023659
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 12:33:20 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxda5gk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Thu, 23 Jul 2026 12:33:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXb2WVlVlqzxKi9oC5c2Qc3CvTErJoq1mWIinUHqja6ZWIX/1YdjsCxWh/1gIJ/tl62Un0OL9PF8OpRclhY51LQK59oREWlc4b3yUJ/7vOQzrMjZh54cOGiI4fYSQvbF68IUqVKc5TTh3rWJ1dmcXGvaFscFA5hi2aqJmAV+B2017fpvNM/m4J83rkIuTVhOJ+Qa3tYCS0KNW5bBGYNFcMcnpERdIAUohf9VN4pSiy3wmt3sc239nRYTMmjS6qJCe+wfV9x7iFiM0WXXB9uMQqncJWHW0udSKv9wnkezOzh4rhW3EpNAw7iivhf0lY8/apRXmFOp+7jCGThCy7NWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4lWKV0rP4st+jFKwZQLlnaRhdi91tTaemfZMVCFw1E=;
 b=aWzavN/hW6u0vJv+4uSBVfh+nQwU2CpatTI3BnwGl2fGwUMs5XltPx29Ot37YXNtIW5pAYPBzDcFyYdPEms1qJz5WZOqP3F7CckNg+YvQDNtwJUlOc5fGOEqXrMm0pXQrTkHiO+suUlD/ezN0arr7nV2JeieEuSbjOKr0Dychn5fIfQM1eNbPn8sVQvRnbEihVQwIxyxlBC78llUOhSNKdkMrP8cr4Ntb/vbPT7xs6OfcV+CnqUUgmgckYSz3rw2B2Pmc8lB/HwlWIYv77dHbHpA0PC2ywu36I5bRYWq1JQalyzXV8T7k7dVnVNZjxNTxiaoH7u2JlpctiugTAE7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4lWKV0rP4st+jFKwZQLlnaRhdi91tTaemfZMVCFw1E=;
 b=LPwkQpLKVnk6VgcnR8JAm2fT0YkIpZ8147gK4ePOIh+GnZq90FSOzE2/0ogz5QFDsfuoxRZRyF7xSjWssXJPVDZiHdaq2k9CkkNriUlPCTOcq+lQk8SUo5CO/f3YCu/hXGrXE/BLEEpIEF4HGvbHCjvNe12WBci46tZYCSCrOTA=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by CH3PR10MB7647.namprd10.prod.outlook.com (2603:10b6:610:169::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 12:33:11 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 12:33:11 +0000
Message-ID: <4be3f83d-f3b7-49aa-ba04-f0c3f983dcc9@oracle.com>
Date: Thu, 23 Jul 2026 13:33:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] libdtrace: Support multiple DTrace handles per
 process
Content-Language: en-GB
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260721152452.184842-1-alan.maguire@oracle.com>
 <20260721152452.184842-2-alan.maguire@oracle.com>
 <amExffYtEWp6jOzb@oracle.com>
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <amExffYtEWp6jOzb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::14) To DS7PR10MB4909.namprd10.prod.outlook.com
 (2603:10b6:5:3b0::11)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|CH3PR10MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 19040865-60c2-41f4-6e07-08dee8b68e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	dpRbR4cz4ZGLUNpUrdbjgLlG+YngeJ3K8MnToovF/nws/4598fSkdq6MhZrVIcnnuXVO6jLPGrG/Tp5HbedsPCzGIuhFqt6OLbC2e1EHyvFimcUuaJLHoN/Ods3QeFZ35SBMd4mPePvEt6UMF/rOrfZdqGZVp9tBYDPmULz/yAMgcKjDEmiN98EYm2nRx24ZBZ9/O+V1TKDer+uf2zB5LDPYgpFcz8y6l5IjCGCwxw55IZFtogMLT1bx5JE4T8cE+iITGRWiclcBAgz10UTCYZs/LOPguGRv9QhlpOLL9lrzwZqFiTkuaNgZ+waFCDi6dFgiCN3e/S/UqJ27uXTXxK3sLWY0QH1XXTeHB8MV984PZKXS8kbO0yA/k6C6eY26OI/qPl7vc2vjtO6y8mqTE4IcOX5VyY1txno0uMphsbiRr6GlLWjzFAj4IbALKzzrnJVrZJqYyv2QGOk3xD4wK9RL69BCdpaZLZaAQp82Z0F/Ll7rpEgVTBaqAWzP6/bErqRJKh6DiqZJ49hHDmbU2EWpQMjROnGkByuoe/gwA5Dy8FlpF5E8trp4jA7oYyGpmh7IwTp42G2uTETek+oD6rOYJsZYv1/n8H9ho2qqbx0bG/YX75VUU130BqbVvypvBk05IpP4nS70MdLkKx1v64M+oX0DVatdB2SOVL1AKSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTZ2RWhrVzIrYWUxSHRIQVR6STFlYitpNy8xekdNbFd3YlgvcGVHQmc3OW1y?=
 =?utf-8?B?M000R0pBRlBmcUdJNDhBWEhKcmh4OTY0NWZjWVo1bXVpd3JZN2VqRGY0STJU?=
 =?utf-8?B?Rk1kUnp2WnJ2OUJ2QkluUzlMQ1pERU9VcDVJcmdrZnh3blZTSzV6bk4wQVhk?=
 =?utf-8?B?eDFweS9GQ1hrdzlPOE5rQnpWeEZDdFVyS0ZsUUdUL1ZDTUZsTWR4clhuWkNa?=
 =?utf-8?B?WjNHOE9KdGhKUXJ6K2owZlVRaHJKTTBKMkdQdDR3QXV0SEpmTUxsTXdNODFh?=
 =?utf-8?B?KzBMZG5FbmdSTTA3NnRJZWo3ci9wUkIySmlDT3pqMUExdlRvVTFaV3d2ODNi?=
 =?utf-8?B?YUJiV1NMQy9SNk9OWDB1U2c0WkFHMHB3em0vcFNvTFdPV01FMDNZOWJsQnBs?=
 =?utf-8?B?N3pXejZNY1gwWkRuVE8vdUY4QzNxTkYvR013akFJRXl3YjMvVTRtQW1aTUZM?=
 =?utf-8?B?aEZrcHM2ZlN3eTJHM0d3UWlBdEttRVFKQmJBUkk2Q3hCdXNMamliRlZQc0Mr?=
 =?utf-8?B?UHpvaWJkSkFKOCs5dDkzNHpicHgxVTZxUUE2YzVydXpYek9kMWZVM0RaV3pq?=
 =?utf-8?B?TCt2dm9ZNjhOZm5UTEhJMWdkR29xdUJ3TXVlR2dUYXo1Y2ErM250MC96VE5v?=
 =?utf-8?B?SmxtWGUwMFI2d1RCSnJXcW5RSTBwRzRCOFhKZmUrelNaaUtoMEJhbDNyZmo2?=
 =?utf-8?B?WTBDUDg2K29Jd3Vxakh4ZytKQVU2OUljVXh2Mnd5dnJsL2oyQlIrbUJQbmRF?=
 =?utf-8?B?TnZGTE0rUk9JT3cvRkxMZS9sUEwxb3MxRHFiaDBad3NhOWx3L205OVY5VTM4?=
 =?utf-8?B?dEs2T1g0SDMwdWVUUFJjTGJDbE5wWHJ2SjZkZ0NOWkxtVEZaQUVma1BRRW5N?=
 =?utf-8?B?YTl3MlExM2t1bUpPUWNPaEM4ZnBmTWFtZ0M3ZU1NZDUyTXNaS0tIVUVMWDZt?=
 =?utf-8?B?a3MwQWdmWVdrU3RsNExrNHVSY3hYSCs5amVYUEpETldjWTVBUXA5Z0haR1pQ?=
 =?utf-8?B?bnpBKzVQZXI5M1BWWUJNYjV5WEdxRTZBUE4yQnRVMThVZlV1YnRJTjBrUUow?=
 =?utf-8?B?SmhHdWxDNU1hY2dGRHErcU5IWHFEclpYQ0xIVnpBeEJjSzlIR3dqOHJOeWtK?=
 =?utf-8?B?R045N0lNUnR3UnVoMlB6K0RzTkVCcDBRb0lRc1granNDWlQ1dW4xSE15YTlC?=
 =?utf-8?B?RVd2WldIVTdCMHZZd2RaZ3ZuUjNRN09qN3NmN1I0a3UrdUFxNlBjbzlqN0xU?=
 =?utf-8?B?UnpmbENrcWErTFY3UTlQNGJ1aWVpRUk2bWJUNzA2NUpNODdKaTRWOVl5ZzZD?=
 =?utf-8?B?eGRvT09sYXhLNUtHMmhDYnNaQUNSclhVUi94SUlzTVZoUW9rdS9oMEJ5cXEx?=
 =?utf-8?B?NW9VSDVhUVZMY042WTRCMXU2TlJaalF1SlR0cWhqbWJrZFJ4VzczQ3VKa0Fn?=
 =?utf-8?B?VDlVNTVKZnEvN3BrNU5YYldpdVhnZ0dtdUZCZ0hPc0g4a0h0OVlYUlZ3Vy9Y?=
 =?utf-8?B?ZVNua0hyUncydDlDSE5FTmVHRVFmMVJwWjhSZlNQZVo2ckxpZDFiejdtUkI2?=
 =?utf-8?B?Uk9aa1UzQWM2SlpJcENmN3FTbE5XaXFHU21hbXBRdEVTRGJDOGU3RG40d1g0?=
 =?utf-8?B?OExIQlFzbEliWmR1RGlvMUplc05oUzBjSmgzUWRENXZwUXNMVDRFeDN1RDV5?=
 =?utf-8?B?M0YxZnJad1J5elp6RXVpZ0RVUkFVT0xDM1liV3pBZWtobWdMUjB1VnRxaVRw?=
 =?utf-8?B?cWlNeUN0TnlhSkxaTS82bURjcmpDL1ZYeFhFYU91Mkg4T3RoZll6M2hSRmNQ?=
 =?utf-8?B?c0lPTzRUR2lLMWFxUGZyWlo4V2txNmR3b05VUE9xRHVHVjRlenNXbDhnTWRU?=
 =?utf-8?B?RldFdk41bUdIRElBb3lWdVFxQlI2UVpYSHF6azRnUG9FUEV4YTZpczFSUndl?=
 =?utf-8?B?NEdVbEhONTI5NVN1Ujh5NlVwUERtTXFOQ2dYRUUvRnlhdGZnbUFjWVRSdDN5?=
 =?utf-8?B?VnNZT2JhUXJuWFJpSG1JbWZZQVBiQXBTdXlvMklEQzIxU08zOWk0TUNXZzI5?=
 =?utf-8?B?N0FxekZZdnNxdkoyTUd1R1hQRTUvMG42OFliaUdOV0JsVkY0cHVsZTdhN0xK?=
 =?utf-8?B?OGtuenF6TC9OOUxiUnQ0V2tERWo2Z29vMVVRNkMzakV4c2dSS2UxdFQyOVZL?=
 =?utf-8?B?ekdyWUhuTXR0bzVxZUJYeGF0NW5HTmRDTklPbGNNc2s4R1VpNzROZTJFN1pp?=
 =?utf-8?B?aDR0VkNKeFBjSFZGWE40akNBSXZOZEtINlUwZXQvd0I5VWdSMDNLbERkVWFx?=
 =?utf-8?B?R2NaSGlCeTBvVEJkYWkzSkt3VFFaeWsrVTBQVGpNbnlqbmdxWHlRUT09?=
X-Exchange-RoutingPolicyChecked:
	gQ3aMphwFseXm7rG9u/y9FpJe0uhIIm2F0ama803KV3T/XhAq+W1UvxbIBPj8YDXn/qTWJR4akz2FmYqqbqKTOVLbfuv+VnYeuwdk0VpGZVwgxiwO0n3hvWd5N2jN3W3oI8OpzzSqybQOa8iVTq5mPE1zx3+GDd0aALhYVyPvs7Gmi+/37Z7Kzv7xSqtqJhZzcIQV452gK1zYHOwDGnLn8VurxCqKZDPvH1SNpX4XZFAX1B1itzlVkPDpD54UC5LIN32NHVFpUmbGhZUNX+tZ6qiqliWU52rNBs/h8sy/pIoPL1HgkXywts7IM2cLIt1PzZ7NkMD+bS65ntUOdd1Gg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ryWfk92+Qx5pvnFHkXnA7rJX3LjLrUgTsshtVC8oiukzZP3phzg7wV7JCUz6uwfdPWgcWasXawjlqees9t/f/iwvOcRW7pVp7FOyW4EcCfQhY8ncY+URVYgiHLmxcdjIgxmImoIYzzmBQDVs8cAyA9v4Q6NlmT3r9bwYdYDs2FK0jPbJxjSJQFZ6dIIa2h/t0tmqU5jZZWrEw9ay6Mcc0+NENc0GCxpCZIuYBbSaB6nfxek1Z7xotp6sLa2BehkSL2FVmnlu+d4oLIlmcm4RqcUcmHQ28aC1ucjOYL6lbW/CfoFHNgJlNI8bFWcDkpPmQOKuddngfJ2bthXvdegBrXv1wdZ07GPguTJ7/RZQCYSJ65yguEVJ2W2qpaJZoCPc4gbofTejYzgUs7U+Q/Gv9IKL8vJfOQpowMoJ6Vqepmhx/S27QUcExazILIOdRJpb3RL8Jk2Txwfjh814prkcgJtYh30DLsWpv/Sdt8791UI086YA2DVniqckZ/PJwtZm4hfQDS/R+iyoHAZHornYV92NdSql56DIRSWYMYgAdeOjDTVs9NHdb8TKTtNV2r7DkDLv/zOIW25fRiM4L+cWwHmuYNA7FPnmuUuT9guLMZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19040865-60c2-41f4-6e07-08dee8b68e2d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4909.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:33:11.3609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUfTMIVvJ3XNJHYxVpO0v7wo0Hh9zKmUZ/tFduaySgxp/r5e4qlgLyqXAF8RihW/0R3mp5VBxNtxP5mfScCDOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7647
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2607230124
X-Proofpoint-GUID: FJC3_yIq1jSnqIs9GgkpuEIFIPeXNSFO
X-Proofpoint-ORIG-GUID: FJC3_yIq1jSnqIs9GgkpuEIFIPeXNSFO
X-Authority-Analysis: v=2.4 cv=IsYutr/g c=1 sm=1 tr=0 ts=6a620a11 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=Kxu-BtIyHi5CFFx0LhEA:9 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX1XSupHcUN90N
 DDjvSD4l611EUZjdQFBXLak3ML5qCdoYRcVON4NxRVMjLt6qFfYJydw6fbp/IQmYwyzEVAld19b
 i8bpYvCGZCfrU36pKAUIiRXghHuY0TVEzFdDvgehn3jYKeS4F/QJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNCBTYWx0ZWRfX0CTeG90E5PJp
 SdwAKQ9QW9e/s2T+m178O4auB23eK+IaONCq21iITORnswMfgDN+RtMrU16bnQSFW9Wi2JAzwvl
 jl+KalFgBQetBNxAN7i/2STaaTWxJO6wYT7nBeepVy/Lzl5wXmnaU4xw55GAMN96zCoJBCt880w
 C/n8aPog4cAiBf1impb4sfYjfyO941ziehYE+cAVTrYqZJjAIPTqJ6Dwj5r+czd5wJJeIwQZPvJ
 Ytba4kXP5Ao51XlA4PcAH0VDonIT2K0NZdBRImP1soPgq33SigEIZ+8ABKyMvdR89eR0yHWahhe
 FRQhJVj4rHa8mQLM4lw1QoyFj7CGgQs1wgFSQNJgZbvPS1omHKwe+FnF/hJy5KW8YOo5ajF/wHM
 5tjfKhj+xGIxGzi4la24Frs7RSTtcw02edFIWzAnLgzS25Ql7kJIveDA913iBt+3EdkcIBxINGp
 WIsJLGnoqnVTfH+BX5g==

On 22/07/2026 22:09, Kris Van Hees wrote:
> On Tue, Jul 21, 2026 at 04:24:45PM +0100, Alan Maguire wrote:
>> For use cases like PCP we require multiple DTrace handles
>> in a process; to fix this ensure we tie global map creation
>> to the handle and also allow BEGIN and END probes to already
>> exist.  Later work can capitalize on efficiences like sharing
>> kernel type info, but for now this is enough to make multiple
>> instances work.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_bpf.c         | 6 ++----
>>  libdtrace/dt_impl.h        | 1 +
>>  libdtrace/dt_prov_dtrace.c | 6 +++++-
>>  3 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 146a66e3..be8a4229 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -25,8 +25,6 @@
>>  #include <dt_btf.h>
>>  #include <port.h>
>>
>> -static boolean_t       dt_gmap_done = 0;
>> -
>>  #define BPF_CG_LICENSE "GPL";
>>
>>  int
>> @@ -1076,11 +1074,11 @@ int
>>  dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>>  {
>>         /* If we already created the global maps, return success. */
>> -       if (dt_gmap_done)
>> +       if (dtp->dt_gmap_done)
>>                 return 0;
>>
>>         /* Mark global maps creation as completed. */
>> -       dt_gmap_done = 1;
>> +       dtp->dt_gmap_done = 1;
> 
> ACK.
> 
>>
>>  #define CREATE_MAP(name) \
>>         if (gmap_create_##name(dtp) == -1) \
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 5282efbd..7db2ba93 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -433,6 +433,7 @@ struct dtrace_hdl {
>>         dt_list_t dt_lib_dep_sorted;    /* dependency sorted library list */
>>         dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
>>         char *dt_freopen_filename; /* filename for freopen() action */
>> +       boolean_t dt_gmap_done; /* global map created */
> 
> ACK.
> 
>>  };
>>
>>  /*
>> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
>> index 4b788507..8118ab23 100644
>> --- a/libdtrace/dt_prov_dtrace.c
>> +++ b/libdtrace/dt_prov_dtrace.c
>> @@ -243,7 +243,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>>                         close(fd);
>>                 }
>>                 free(spec);
>> -               if (rc == -1)
>> +               /*
>> +                * Multiple handles in a process mean we may have BEGIN/END
>> +                * uprobe events already.
>> +                * */
>> +               if (rc == -1 && errno != EEXIST)
>>                         return -ENOENT;
> 
> ACK, but I do wonder whether the use case of multiple handles in a process
> may cause trouble when one of those handles tries to remove the uprobe for
> BEGIN/END?  This really should have a test case that shows that two handles

I believe we are okay here. 

All handles use the same per-process event name (dt_<pid>_dtrace/BEGIN|END)
and accept EEXIST when it already exists. Each handle then opens its own
tracepoint perf-event fd and attaches its own BPF program. On close, it first
closes only its own fd, then requests deletion of the shared uprobe. The
kernel refuses that deletion with EBUSY while another handle still has a perf-
event reference open; the last handle to close can remove it. So rather than
relying on maintaining a local refcount the kernel helps us here.

> can be operative at the same time, and also a test that shows that closing one
> while keeping the other open does not stop the second one from seeing its own
> END probe firing.  Ideally, it would be two test cases:
> 
>  - one that creates handles A and B, and then closes A and checks B still works
>  - one that creates handles A and B, and then closes B and checks A still works
> 

Sure, below implements this and passes; I'll add it for the next iteration:

#!/bin/bash
#
# Oracle Linux DTrace.
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at
# http://oss.oracle.com/licenses/upl.
#
# Ensure END probes remain attached when another DTrace session in the same
# process closes.

if [ $# -ne 1 ]; then
    echo "usage: $0 <dtrace>" >&2
    exit 2
fi

tmpdir=$(mktemp -d)
cleanup() {
    rm -rf "$tmpdir"
}
trap cleanup EXIT

cat >"$tmpdir/script.d" <<'EOF'
#!/usr/bin/env python3
from dtrace import DTraceSession


program = r'''
END
{
    @ended = count();
}
'''


def start_session():
    session = DTraceSession()
    program_handle = session.compile(program)
    session.enable(program_handle)
    session.go()
    return session


def assert_end_fired(session, survivor):
    session.stop()
    session.agg_snap()
    rows = session.agg_walk()

    for row in rows:
        if row["name"] == "ended" and int(row["value"]) == 1:
            return

    raise SystemExit(f"END probe did not fire for surviving handle {survivor}")


# Closing A must not remove B's shared END uprobe.
handle_a = start_session()
handle_b = start_session()
try:
    handle_a.close()
    assert_end_fired(handle_b, "B")
finally:
    handle_b.close()

# Closing B must not remove A's shared END uprobe.
handle_a = start_session()
handle_b = start_session()
try:
    handle_b.close()
    assert_end_fired(handle_a, "A")
finally:
    handle_a.close()
EOF

chmod +x "$tmpdir/script.d"


"$tmpdir/script.d"

