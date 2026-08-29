Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BCB3F1059
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788004812; cv=fail; b=i7z2V8qoM+kRtY7PcNPWw3zOMivX4BqGdJYo0GcUY3W9qivUNEpY4PVjTWlGuGBdD28+v8ky9L4lZEHcw6PvhyHnygve0OxXoL0sXMN2YN2B2uBg/mgBhMBb9HPgEBQ1k06hSbO8IzsIe1NSqULLHs23Ee16EIOyD/kExwbiwfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788004812; c=relaxed/simple;
	bh=tzzO4KVk3RH7N1BvcwC6OiPikiLPE+xsIXdNV/D8uhw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uWA06VJVt5MUX8zC0y3YHkd4GxcWkYMp49zSdlLqGt/vUU0mbqJ495cx/DdNIExdWu+U325xoxndv7+2oYwU0fTryf7GvxsTK7eich/HJ6QGbN05IAdCByf9nPLJr/e5dTJgQ++c2ABp1ZLc9pUAyqB7yjIP4LZq7FzcB+eygzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pz3sKSSX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YMr11Cwc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pz3sKSSX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YMr11Cwc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TAx3le1245055
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 12:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=koyjbTcq6bFLd1IccdKiltlINS8R8IFa9HiaBGLuFmk=; b=
	pz3sKSSXEvDrLZPTAcm1EWw2GjNExuDiNzp5JAl9LyOxB3EU8qOqpjiuIfgA1IuH
	50hwtfPxQ64nT1fw4zcM/dBkXsEW4+GV3aelVdgEmlk6fXxhfaO3b5rVecSW8aPN
	dqT7JZC1NyiMRTZHnty8jbFqtQpYgQlpkobUNK8cgnVSfOuYwFaqzmfOB/tR2+0T
	/jUvjXUfiM5tMP0/SkZBOguUQP2K9Yu9V/9lsZTCEtCc1Ry8cOooZOu50bydFX1q
	4OkA3lBS5VsmM80IS6YFdeFNxGzYSSdZr4j5VQ14B5uSv20HHBo1d86y26J7djQU
	gS7TGpiH234EZ7l1RcJtZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbpbar80w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 12:00:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67TC04MQ023008
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 12:00:09 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012030.outbound.protection.outlook.com [52.101.48.30])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvbg6sy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 12:00:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzGYRwLVjc7tjcNf8z8tyKo18E32s51HQ1K1FueL6jcdtRUISCHqjDpAy7zD4p5DiIQAY0j9qpAGBgcinHSA6GoYp8PGt3fm60QHpo2ANUoj/Rxk7aoLf7XU5plPj3tqzr2rI/uJwm8wXugLA8HTWKSEXeZxDqkpkwKS5kp1lbDgT5YFzOuEsmHtTSCihEi/QfRkTFwJif8eRBZ9jg9NvC6wdrxkUGhGv/ynROFbJzIKoLyHf+kauVxI2n8v/rIGRaRFeaZfgy2w2Gs3GhZmNJ083mjQsEZuf9cwulcCnbpPk9qc1oGXFngz5NDdGz4ac4ILvL+KCAO5miasJLFPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koyjbTcq6bFLd1IccdKiltlINS8R8IFa9HiaBGLuFmk=;
 b=RuI9jnse5QtU1YC2YBuYHvQtRudcFHtEf16YR+E/7gxA7ZxiqCd1/hOhT/V2wC1UijdmL5+lEzXj/WTVvyRtiPc4Ss+mk+yKr5MbAwS4MMsMPAFB6avZ+MeTp+cH6CWLkU38QvNCwcsDfrk1SGDmR0Z1lHWrgaIWBnYuMq19jZOudCBJFtMm45d2I41zLTGJAw/qoL3ZOzcBHqGEWbRiZcVO57GZlKDfdRgzgrb6SsWDaeMTEFeyzHC8Q8ApSVjfT85o6BmSrvkB3z7e3U6UgHbJi3JqiBypw7oMGA5+CXmueWcaCK23nYSq9dVi/iS2C45tGg3ubI4qmW/6bobLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koyjbTcq6bFLd1IccdKiltlINS8R8IFa9HiaBGLuFmk=;
 b=YMr11CwcjGty2bf6dX6A5cQDoF7PobY/P63iMGOPlwXJxftVipongecc5QJQw2p5MtY2D/Icmmi2ekGECnQtlxgbWcSnLMbIdJCKhwSOeasQf2Sq9hei11OAqLIUZVTtfMIsnGj+DSE3e8jW9LU6e2FZGqXnKjz+aU4sBOE9D6I=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by SA6PR10MB8112.namprd10.prod.outlook.com (2603:10b6:806:43c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 11:59:52 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%5]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 11:59:52 +0000
Message-ID: <935b20fe-2000-4d11-83b6-744eb9bc2e2d@oracle.com>
Date: Sat, 29 Aug 2026 12:59:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 6/6] dtprobed: fix dof_stash write failure
 handling
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <0508ff7039a7532b1f5eb94d6dd8aecb@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <0508ff7039a7532b1f5eb94d6dd8aecb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|SA6PR10MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fd8037-2762-41cd-c62f-08df05c5088a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Iz+gEOjOYFWwqtdDocvXDxzieYg84VocdyUfULAtXnBqeIzkfqp7AHFWAYSUHDLI6RnWU7pKWhm7aYsTml8f0vpxpMIuRnNyVcLHiD6+KZ1S35H13z7ntWhWhNdy/vTmBsm3vhcRF/znyyHrKA8G2JRHs457J7Dcn/TJ/EyqHK7W9rFOqB/MIj9dD9MlqVgnNsD0XPnfI9KhYmQ9i2cWSe1fXcUK+Ktymu81ScFo3tm2Lme4DWFXgpKvJxcXhSrvZfge3Z2KyvaVQnVCxHQTScyrURBwpv/jJRcweC9mmbikaYH2ZJ+gA2wscjst7DsdCdV20bk/yXOEScUYLu5ZbStgDYxNEwYiU8AX4KLTAaPnpQyucQzd565lV1pV7xVY7dI5Js4kYqmTcHqPmDTmNFEGbwss4bhXunL//4E4lIUHzpw67BLn3q5NVePtZ5z4PdTIT812abNedvnH6L6IHECpJOaI1XgUqyF9b0QEf8sSJFM0OE5pcnx0EM9o4mK59CYZjfzZGdXxG2eMFcIStHeOPODxURP3sIGZI+hCWKMQsKupis8q4dIGEiBvcLI05E/6/aoWpzJFRzsc7OHFexyMen+o9oCm1/55ORpHjnrsYMIrpFYRpkZ4UCgZl/W/ddOsWBLEDZ8Lm/oT8BMKnX8Xad93U7ed0h97jOHhqPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW5NcG92UGdRT1JYTnJsc0ozWkdncWlvT0xGTGR6d3I2RHg5M3NydU5JZVl4?=
 =?utf-8?B?cGpKYzlvVERlbWFKOE9JN1ZnOW5sTXJ4ZU82WDRYb1BtNk9vbnhQRERERHpF?=
 =?utf-8?B?OEJyUHVoanRoT0lPN3hpMkd2L050Z3FoMEQ2S05sV1JFNWRoVG1FTzZycmhE?=
 =?utf-8?B?Ti9qM3VKREtacGJiNWxwUFNtZXVWcFdGNjRTMm1HeTVXLzlCeXJJbytvcXJi?=
 =?utf-8?B?YlN5dE11NHhHdzZiVXdLVDcyWWRtTGRuQWlYZ0RiaDNlTjJrRzJncERLd0Zz?=
 =?utf-8?B?L0dKOE1aRWJtNmFPY3RkcGpBaWJCR0JBR0MzNlFrMnVmNmI0Q0ZVZFl4blpR?=
 =?utf-8?B?Z3RWK0JNbHl3U0tuMjZYRzdQMlFIU3lzU2tPMkYzNzk3UXZiS2dSUVF3K2N1?=
 =?utf-8?B?S0RnVmRqZlorUzJJM21oc2ZqZFBNcVlNSTQyTTliQmZydS9YQjhMN3pHazRx?=
 =?utf-8?B?Q1ZENlU5em5tZEE2MWhyR1BValZlR1F4REhabm9tTitaZ1JGQWNhR2JYUlJo?=
 =?utf-8?B?TkFaaVdUTjUvUlA5WUUzQS9EbnpWdDdEZ0VrWitIbTNOSEJFb1RhQVU3TFZ3?=
 =?utf-8?B?SGxibzA5bWw1M1h0WEw5R2dMOHkwTjFPQWpId0h1R3BJOEZSZHZJT0lRSUEv?=
 =?utf-8?B?aDgwb0huT0V2M0hkNmhYckNGbmtGeXV0ZjRZMldPVEM3aGZkcTRicWxtdUc3?=
 =?utf-8?B?a0NFdHFIdmJPblJFSkZ3WWhMNUtIVXZlMUJkOEFYSjMrclUzMmtwV0pnaHMy?=
 =?utf-8?B?dVJ2cXo4Z00vWVd1bVZRMFN6QTBlSEIrSWlqVUZRR1VnVmRQZDVTbElMNktm?=
 =?utf-8?B?VnRGYU1BYkFEOWIvZ1BKTnBUZGFWMGRrUWFPeDJ6T29BeEQycHowY1lhaTFz?=
 =?utf-8?B?RFNOcXljb2JqSnlJaytqWTZsb1dBUERPUDNCK3dJZU5qamViYkJqVjBwb0Zu?=
 =?utf-8?B?WjVNUXN4a1FOZkJWVC9wVVFVYlIzaVdSSDBPV3VOemkycndzdUpCcUc3NkVy?=
 =?utf-8?B?Y3J6TXpGT2JzeTh2Uk9kOS93UXM3N0xqcWM1UkkxblNuaUZwMFFLVHlLSm5v?=
 =?utf-8?B?Z3EvWnlkMjhnOUJnUnpXd2ltb1hXM09HN0kxVVZXZDVNaXBvbEtiSURaUFBz?=
 =?utf-8?B?Tk93WFZBZlJwUmQzelFuU3B5SFBER2NWK1RycEdJSWVlODFEbzVocGRicUFK?=
 =?utf-8?B?eGRmdEcralJyUjVjYVdHaENYSS9qVEV0YkxPOCtpbWRFMVNIdE1RRVZCajRR?=
 =?utf-8?B?R2lGeENPYzdDcXhCVEFqT0dDbHlVdkFGSXFWSlI5bFk4MGVUWUdyREIyWmNS?=
 =?utf-8?B?T3FJQ1BjV2lvYVVXN0c1bTJmVFJacHdMYUZKMUladUdQYUZVMmRCRTJCRTJ5?=
 =?utf-8?B?VzJOTHhsMDZLc1JjNHlXQUZFclp6UmRDYm9LcjNlODY4ajVWbW9FYWNHSWFC?=
 =?utf-8?B?TXhDRDR0VDhrVHZKZkFnLytNRzhxQUVESU8zQmZpaU51MEg2VDBKK2laenlK?=
 =?utf-8?B?YmRPUm9JTUg0SmN5WlhJNjhmakM3YWR2am9UQ1dBVkJ0TjZITWhmQnVaaGhn?=
 =?utf-8?B?NjRKdHdrN0FSTXByRGxxQnBrd1dsdmNSVDZ4WC9oa1lDYnhXU0ZDS3ZMNURU?=
 =?utf-8?B?Mzg1UnMxdDJTeGY2ZytpVGRRbGFlQ2EwM2FzYXdLRGs4ekdTTHIvQ2ZyWnRs?=
 =?utf-8?B?and1NlF3d1J5T3p3WWlFWFIyOEZCQmZlY3hTdHd4VWxDWmdxTnB4WnJhYTZl?=
 =?utf-8?B?MnhDbHQ4bXFvemc1c1lBdWQ3UXFzKy9ibHgvSC8wQVg5eERrZnJweEs0bU5H?=
 =?utf-8?B?dzNGNjdpVGpGRnF5c241WCsrNG4vRHUvUHZwN3lBcWdpTlRhRHdQVGEvbi9V?=
 =?utf-8?B?c1VIR1RLb3c2RndkMmtBZGpIVkU5UXo0NHIyY2k3S0l2V3Fja2hTL2cxTG9v?=
 =?utf-8?B?TkNYekIvYkpmck45NDEvcmNvcFJmNCtPZU9QajR1MWxwbVhRM0FHRk1BLzlS?=
 =?utf-8?B?T0liVER0dW5DY29KcHlYOWRBV1Z1c1dXUVlINy8yNHFTR3hkSDZDYUd0T0I3?=
 =?utf-8?B?T2VjaXdCeXZWbERNaW40bldDelZGTzJsYVhoQWZnUW1GZzJ6bUhhMHk0Rml3?=
 =?utf-8?B?WndsYS92aUZDNC9UbGs5S1hiTURLdGdWNzlWRVBadWtERVlJSUZtejkwbXBl?=
 =?utf-8?B?T3FmQlNSY0luNElFNHdITk9XcVN1OE14enlncFVRYmJjMlVYckZlOTVXRnR4?=
 =?utf-8?B?WGhFdC82SkNZNFhBQmU5Rnh1dW5TUHlwdUM4c01EYXNMRGNiVUNNNGJWTTBY?=
 =?utf-8?B?YVg4VFJZUUJtQ1dISHdIR2lmVzEvbDBObmVoUlNlcEFCa2JMeHNhUT09?=
X-Exchange-RoutingPolicyChecked:
	hTiDm1o2Jcty1RwsvEv8ilpBwWqG4sLJy3KREKuA8ED41PXiujzjKXRNu5Kd2fT+dVQM37Wu0yP89rfKMqvAmJTKZxeuqgxhln69W0utuwPHo41zftFHAMJU+fTadyi0QRbJVWFd4cbXS4MO9hcBX6DtEpn/MwCGEHXDxa/I85dtuwH7RW+CmaTL4n5dR/bNPw4HSlDE04RT0W9JBtduBM5Qw0fMpuXCdByhgGzb7EWrgVfNNXT4LibhZxt05+c+q1D/kWwVFU03QV28wjm5lByPl8+pGTCmQh9FABMxyorXLbwh0Qn5MMeLckO2s0wkj0c3sM0DKz1k2CvKdw2/QQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YFuhHerDOLpA3q7EUhMUwflDkZAC6hiNLtWIOouEeERN1X3gCT7PrErDFYlQodu8vgACjFm3BpZj+BjRFNFWFL2w3cLMPRZ0L7ew7myT8AqauvPHqurQolsMrb55A/Kuu+0J3keBqLWcA4jq1w0tMVx7F8fOTojfQV8KddVJJs4mtdPiiFWFSEN86uYlG3nVHhpp2C6h0K3Ld29CRa3wRvi8haP8lEUM+ngQBVPCkj1FRccruDl6IvdAXpRxmi05VPp1oMGcv21gH38uwLbjcIXmPa2Ny2WAt6+yMyBj5XkoAOxonKM7j3DbV0pvYtgrNAOGNRO9n/oEChIT+mSybr+c1e5H+YR+UvmGJ+aqlmGRANq1TfAa0bvM9GRpU2GEdmBevF27uP7ZM0iXU3VchLZk0HC4sbApSFVc8KcJuz29K+j/Soczog5QvbwIX4fVW/rbEJRr+QHqqd4M1WhX75V3EAGoqRl92v9kejALogmg8mftAKRjxrgjEEYlTg/MMSR2pXxct6XNY+ZzdthO6XJMreNxFinVkOznr8ezIZ+4l7EfTGKArVUtznuXCcFf6Ip3SNx087QoRoCfu2LO3hCovjAfAn2q52BmudjOMnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fd8037-2762-41cd-c62f-08df05c5088a
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 11:59:52.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhNVFzKI0aJc6jwdAs4ODESlIjm0sXO8ERJATWA6Qsp+TiaY7cG3ocd4jXpx/ABhSsCSb0sO9cqsKUbjLo1pOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8112
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290103
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDEwMiBTYWx0ZWRfX7sv4SDTugQuE
 /Y1qoHNjCc1EDIb9ZNeJhz6SNwYOJixtSjKWBaSgGtmuFlQEgEloEwxh6JZieEPBszrvUz/9hI/
 sXSVaQFfbJ/nPZKewUQf6mBnQdUNY8o5gD3ElC1oglmlLD3/k6hw
X-Proofpoint-ORIG-GUID: rdk0DaLI9eTT4ZIrLWWyy8XuNAJHsQUs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDEwMiBTYWx0ZWRfX+T8ezjTnJUw8
 isZx+u1DOwnzG9CTer+jiFZ08jdvbkx/k5Qw5U1DSgussJIbbk+PnSq0UIYswfQ2XrAIBE8DLnd
 8eSQ26AqbDa2+ShFmDcwnnzcvG2vJCAi++TbDciiefwb2xOXnW/06BtA2GN4/tRwBsfPSqpZg6D
 0zeYmvkDBy/vXtjXT0XAyMpy2uVgpMb1/OuUo0YdsCcgTx5bweSNCea7TBUXfpJ97PeFo+oElhC
 AY0x7KzbpOAv87InVN1IskVxL9HNMAmQNP5iv18qGfwhHt5TVKf6Bobm9/dVuOF56/gxWHBi/vg
 0HUJOBSbcsZhBafCMaewj5gUV47EOjbuW2w2AjLoYJJOEF6EkrFmTeg1kCXzfrbW7MOjmV0WPdN
 nIzJOCH/CTifHZDl7Yh80VMHu3PZH8iCL8mGLznM2sBG4Y1phbHDRk2pHflVAccTEofSKmxZU2b
 GeQcBFXhOVdd2HFjajQ==
X-Authority-Analysis: v=2.4 cv=DMi/JSNb c=1 sm=1 tr=0 ts=6a92c9ca b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=0vVsowvZUffegHRM0wEA:9 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: rdk0DaLI9eTT4ZIrLWWyy8XuNAJHsQUs

On 28/08/2026 20:09, Kris Van Hees via DTrace-devel wrote:
> 
> Use ssize_t for write() results, retry interrupted writes without treating
> the negative length as progress, and unwind through the provider-close
> path if writing parsed DOF fails.  Replace the no-op assert(1) in the
> corrupt-state path with abort().
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Took a while to make sense of that dof_stash_write_parsed(), but

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  dtprobed/dof_stash.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 6e62bdf6..144cc98d 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -420,10 +420,14 @@ write_chunk(int fd, const void *buf, size_t size)
>  	char *bufptr = (char *) buf;
>  
>  	while (size > 0) {
> -		size_t len;
> +		ssize_t len;
>  
> -		if ((len = write(fd, bufptr, size)) < 0 && errno != EINTR)
> -			return -1;
> +		if ((len = write(fd, bufptr, size)) < 0) {
> +			if (errno != EINTR)
> +				return -1;
> +			else
> +				continue;
> +		}
>  
>  		size -= len;
>  		bufptr += len;
> @@ -796,7 +800,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			state = accump->parsed->type;
>  
>  			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
> -				goto err_probe_link;
> +				goto err_provider_close;
>  			break;
>  
>  		/* Error return from parser.  */
> @@ -817,7 +821,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			 */
>  			fuse_log(FUSE_LOG_ERR, "dtprobed: PID %i, %lx/%lx: internal error: corrupt parsed DOF: type %i\n",
>  				 pid, dev, ino, accump->parsed->type);
> -			assert(1);
> +			abort();
>  		}
>  
>  		free(parsedfn);
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

