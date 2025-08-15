Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEA83090DD
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755276262; cv=fail; b=TF+J9f4BuQ6ScKGzis70ijKrFoKJfV6mjtw6SjmeoSBNUSOu4p30nwr0nZRsBWdeaRghk2bOpUHkxfsyi+Kqfulp/vCf0mCxYzOemaAFI+hKj1S8+PvoJKn13wDKabVaxu4It7FLB1rLXe26tLeDoWFVMAQyJ8ytB76yezW41BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755276262; c=relaxed/simple;
	bh=bqBHQNOxbq17/U1OpD/I2q0m84IXfCR3pAORjHcWgbo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K6tXqCCMV6UGSmDpAYZs/LnQjsX0syRvp4YRXixImRc/qqt4nFBvCEhYiX6/6f4qjL6drZpftgJm9rS7yn99ilHqGj9m+4cbpOdZagxT/YYMFqwmJUcR/IqUwr4oAFxdGbqjqVJ/l5E4CsQ4jadYQe8+70wZmatjEMSytm3reik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R+vhuoJ/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E2P9qr8l; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R+vhuoJ/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E2P9qr8l"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN4IW021434
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 16:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ZXiff7DHhbOGEZ034tXy6hu8joEtNPT+HNaJgroPK54=; b=
	R+vhuoJ/kx2IirIC8sr1y8KB8i9wTOEULIyCCci+AomR7NDxXTns/qQmzhvI/3JP
	b0Q5TfiNgqckRR9k0Xt+4SIqottU1BWLFKLK8P08wLccEsLqMvWAGV2JMW6ET9PM
	6YX9IJ6GmE1mEOlj/p/DIdF3ey4+2pAX1MLdmk8weYQVOcoAGsg9VWVQnfZhHGij
	GM7/VYm9K8bPiEqAyzR0+K5hj0Hj0u12TYVshGNuccbQx42suRfzjVuwwTnLWpEZ
	IyQG6C2XWUrjukfWHRWcEN7Wq7TbI37krSsNJDA6nZitg365d/c1sRQqCmbUowL7
	/QeE45Js/RXfmVQeW1+HXw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchcrjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 16:44:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FGLl0q030020
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 16:44:18 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvse66gn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 16:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vo4SvDfyGtt/YPt1Sf7k5xLmsXgGfEq9JQk3qQxStaCKTcK3f6xGbQsTINWoLeK7hVEYjJYzY+9hrzXlpyz5+H97Vba9irGDFdRuVWTe0VcAlXdl1DE48NM+xSyEr1nOhLFm1fkY1rz6PZU17zKXfa05Z4iXcvCyHvpwFj8FA9Gy4DAMhgZKXHm0wvHE3dFNtIFrsZmKfin8tfsCxlUTZnF5KZ7BhBK0/D/sPm/1dWaasYLiqd2ykug62HabdD9v9ypJaySKTHI8YDKMrI6TaSvJK5kF1LAB4Ez02MAnIfZrH2SCYg3hQ/iAG+aoqL05wqYfvOTfk0Ld3LCPpEkJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXiff7DHhbOGEZ034tXy6hu8joEtNPT+HNaJgroPK54=;
 b=xp2vJrgntOX3W3SKSE7nNgly+dolvdp+8E5+5GFBGSkSt8poGiHFs2RQKKlrIa7PTb0B+vdBf07DDlhg1WgwQD99KyQrnCBeGISuF7X0LZH78jZiSxVpVfLTqIW29m+p/7p/fUwei6HAbLVAzDmJv3pJHh1X+sZAPJ+gUce9i80EdzkMyeB8bwAaWNh+YP9vEh0TPn0bUgY2KA3vBBB5hNHHxtSr3VLI/njMKTWMf+Tp8f3V1NheXCz9YVnko1JTQumLTjB7FM1c86q3lNWkvWcG/fKORvogl430djv79kmU/Dw7JNi+7Y4lBWYhJ0s899/fqmmac6SUl6+RDyF1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXiff7DHhbOGEZ034tXy6hu8joEtNPT+HNaJgroPK54=;
 b=E2P9qr8l/0rAL1fLfrX5bFY0WYaXQHSK5siifWtjfrXaonCR+k8zgam4GVp01GfuPP8SfUM+6lgzZVZelLcTZY1NP9wpaUV2sa9JRuXHc6A9H6YNaH4LX0L0Fsw9zuOlkzIzuZAmkOwLe4lSSw4CRA8Zv03r5IXUq/BpC1NyFrA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB4874.namprd10.prod.outlook.com (2603:10b6:610:c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 16:44:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 16:44:15 +0000
Message-ID: <d0117217-c806-81fe-2a12-7e763037a9be@oracle.com>
Date: Fri, 15 Aug 2025 12:44:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4 7/7] uprobe: do not call populate_args()
 for pid probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56729DEEAEAB33E8D287851AC234A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56729DEEAEAB33E8D287851AC234A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN6PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:405:75::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 358dd413-0ad2-487f-82b7-08dddc1af879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEJMSWhrTnhlVGJBcVFrWnZoYXJ2OGlkOHRDUVZkOUJ4RmtQTlVvdUlIZlJx?=
 =?utf-8?B?bnNzcWtEUklFRjRnTDNURlkraXFLTlBFQm4rT0d4aXZGUThaQ281WnQ0NVJa?=
 =?utf-8?B?OVBLbStGcDlWT1E3ZjBxU3ZXT3VybE92N0dFYVVyeWg3NC8xM2l6YmtpbllI?=
 =?utf-8?B?MGFWZ1AzTlpjSzVVcnc2MVhLSFlzUFVHZlBhd21JWGdFSlBqODluWEVTQk0x?=
 =?utf-8?B?K0hxMU10aFBraGxqUlRaOUVtbXg5OFJTOWlTcmhFcG5GOWl4OCtJTm5ITzJ2?=
 =?utf-8?B?T1ZJclFCVWd6QklOcU9ZZVBEQURvbTJiZk9yRGhBWjRFM0pPQkJuZGoyd0lT?=
 =?utf-8?B?WWxBYXBHVnkxeGFtK1ZkMkNDaUxkYUEzTzY4VUlrUVQ2cjZEaXd0bXc1cUx0?=
 =?utf-8?B?am9QeXhIQ3o1RnBzRjVkWkdIMXZXTUVsUU41V3E3bS91dVFUKzMxb09vODNH?=
 =?utf-8?B?K0JhQmVrWDFDOS9lTHZHU3JkZjY5NU5RZng3SlpzV1NyM1pqOWlqRm9EcUlY?=
 =?utf-8?B?TFBURmtnangrYWxUQ2xXS1VnTk4yYWZuaThsYWFZSUV4MUNsWkFVNXRBc0U1?=
 =?utf-8?B?a2tiOHdVbmVFZHlxVWZCd1U1b1A2R2ZtN24vN2NpZ0l1cUJUOHd4RWxnbTQw?=
 =?utf-8?B?YUVIekpoYkFLZlNSd1NNVm5wbUhrYzlGVnJCenZnT0lNb3Vqd25rZ3FaOWdT?=
 =?utf-8?B?ZTBHeEZlT2R1RW93aCs3ZWlXSkhiQ0xWNGJIOW5hOUliQlJUSEtVNWJhVHlM?=
 =?utf-8?B?MnhBWXAxbzlja2Y4aUdpN0lPdVE3Q3ZMNEtsSkJPRzU3dXlYU2lSSzdqTUFt?=
 =?utf-8?B?WThZaVBiNWtEaXhRVElkcXRzaDJDNkRuVlRSSWo4eEViQytpcDhySGUvZUNF?=
 =?utf-8?B?UnBodGV6VnNhVkp2SjVBYVJScEpRdmU1MVJ0VGlCaWs1RDh0QlRycW5MRjJq?=
 =?utf-8?B?ak9LeDhVK2lkV2o0TEV0ZFlGekV6UXVVUVR4cnZyem5SZVpHTmhXSzBnamtY?=
 =?utf-8?B?VloyOXV1TEZ3TkNSVlFSVEtJeGxJOEI4V21KNjB6bVhWMENzUXBXaGhWelVu?=
 =?utf-8?B?b21BNXF3MDlTYmJOOHUraUNqVzdVcW1IR0tLb04vSDg0cXFxUXFaR1p4Tk1m?=
 =?utf-8?B?Tml5VnFVdkhwbHFJUWVKcUYwaG5VODlxNDZnaGViN3Z2Slo5UnhGZkhDcTBw?=
 =?utf-8?B?REV6K0taNHZVN3RPd0gybVNvNVR6MjRQVTFoMEg4SGRoT3pPeHJGaWlubnhR?=
 =?utf-8?B?eXFyZ3pMdDBtZFpLQTRYWHZiK29IYnBDN1ArTWNPSlVYaHBncm55V0hobXk1?=
 =?utf-8?B?a1FxM2ZnN3hkam80VkdGdmhNaW1vVEZxQys1d1FXeXllVElaRk1CWkpHTlhi?=
 =?utf-8?B?dS9VRTg1SjhVenBhemJrT29rTmVhZkZ1d0FWeVBOREljZWlqUjJUSkt1NUh0?=
 =?utf-8?B?THd3MUI3WEFCN1ZPSUxhRHQvMjk1Y2JqL2tML2VZSjZRdVoxWUx6NVMrMXJG?=
 =?utf-8?B?TlN1YlVTcnk2bzgvL3NVc0RZYlpQcFlaSjRVRGdJY2p1WVVHdjZBN3pISDJn?=
 =?utf-8?B?aTAvcnlqS1U1UEZ6aWNCRS9DY0ppUks1ZHgycmV6ZWt6azJZQjMzcTBlUmpZ?=
 =?utf-8?B?VzhoVzRuMkhUQzZodnliN1R5NUVlWTZLb1d0ZzU2Q1Y5Y1hwSmlic2ZudEtw?=
 =?utf-8?B?MGJLRU9LUGN6SlI5RGtWY3NZQVhJdnVJN2pod3haZGlUK2ZmLzY1bUVwVzZz?=
 =?utf-8?B?clo5dHBvSjU0YzhOTVBnOXZYVjJJSlZ5ZzNXQTNXMkhudHpEVThBMkNJWXU1?=
 =?utf-8?B?TE5yWSs1UG1uU3Q2V2xpSFVKZVl2Yzk5YTFNM2srNWhKMUNWN3IyK3N0blcr?=
 =?utf-8?B?SUJ3WC9ZRGcxRUJzZ2J0N0E5RytNbXJFeFlheEtUb0lPVE00NU5IN1BhR0g3?=
 =?utf-8?Q?v2p+RrX4hLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRLNm5GVnBxNGI1Wkt4R0pDTTNVSW11bTI3QUxZMGppS1ZsakNjcUdDeWUw?=
 =?utf-8?B?TUE3NWttZVd6aHo1djcrR091Z0tBVGFpQ0pSNHYvUVNuZUlSWThGbVNKdE9H?=
 =?utf-8?B?S24vc2RKWHNvNWpwM0RVVU1wTTBFbmxRcjFsSHdsRGF3SUsrTm1jV25pc3Fk?=
 =?utf-8?B?YjVHb2dmQUhkbHk4cG5UV2tDcmtQT3JrdFNrOFlNRXJnTVBKYzBHaG9wc09x?=
 =?utf-8?B?OXZtL1FaN2c2a01OcEJEdHhnUXhtMWdpOTJ6QzRJVUtYRjNqdzNCUFpuK1gv?=
 =?utf-8?B?RFNUb1BKQnpPN1Z0dk5MS2VzanM4ZlAwWXNuSXBlTXpWa1RCcEJxNWg3cjlk?=
 =?utf-8?B?Nk5ldHAyRlkzQnBPYjkvbkJyZ0ZGRmhFMk9UdEs4R2FFWXVWN1NTdkNyWGxq?=
 =?utf-8?B?aytoWldGa2w3NC9VMW4wcTdkRzRoZTNjU0hNbDU2SDlpQnF2NjNuTkZLMTFN?=
 =?utf-8?B?S0N1VXQxZ0cwTVQ3SEhjSTViYkdKUFFkb3E0eWQyNm55a0poSmJxbVY3Q1Ar?=
 =?utf-8?B?YjNpdm1hUDVPODlrRW9BWXVyME05R3IzbURhMUxva01yMkExcWxlWDd0Skl3?=
 =?utf-8?B?Ty9WTnZXdGt4bUhJZHFOMjRhZVpMakdNd0tUU0l1cXZhT1V4UDQ4WWdjeE9y?=
 =?utf-8?B?dWpIdGduMWlGUTZtazd5VzI2dGc1QmZVbzlNMWV5Wk5SS3I2Tmcvb2E4Rm05?=
 =?utf-8?B?dFRtSy9sUFBnUVQ0aGNQS1hjN093VXMySjdMMldXVXFBWkUxcjViZ092c2gr?=
 =?utf-8?B?dWNsMlJraGlKOTFSOHBWVWk4eXJzUVhXME82ZUo3QWpvQjBIcHkwNmpibWFW?=
 =?utf-8?B?WkhYMTNVelpNTXFqTTZ0VlpwRC9jZzR5RERhbmN2R1BZbm9ZNGFtUEthek5m?=
 =?utf-8?B?Z3JrTTQ2RGcrcjloeldkaXpQL25mdHF6U0NLMzhBdUk1WXkwc1RpdVA2OElM?=
 =?utf-8?B?Ui9LRmVDRE54SDM2MnljRmFXUFliWFdSWHRXdUhIVmhzSERmcEk2czB5dFhJ?=
 =?utf-8?B?YkxIS3NXdndXeHpucUNzbXE0WEhJMlRXK1NYaW1mbCsrM0doblEyMEZHRUVu?=
 =?utf-8?B?U25kdUVpL25aYmpOWXh6QmRxbjJiMllwTG9xeE52a3Exek1qcTQzcDBCYnh5?=
 =?utf-8?B?RXpIaWwxWW0valBhUzl2M3JrYzRjZndZOFd2V2kwVDZrZVdadWJBNitWQnB0?=
 =?utf-8?B?Ykg1SzlteFpxN3p4cjVYUVI5OEJhRWJMNVQ3RkxxQlZqT3BtZXJJbkNnbjhn?=
 =?utf-8?B?V0REMTNleW92RGFGbzdXRlgzWU5NWElSa3ZmakdUQ3BHeHcxM2w0bCtFVGRn?=
 =?utf-8?B?K2dDZ3NOSFpmSElkSzhWYnBnaDBHTnJaN0xUMjFtTnNGOEJKY1dHVnFWcnRF?=
 =?utf-8?B?VEwxWGhLTU5jMG53elYvb2lxaEQwSS9QVTU5RzgxazNGNzlEaGNvTmc2eEg1?=
 =?utf-8?B?WGc5aGRsV2dTL3dmM0o2cWpSUUNia1ZlQVZMMGg5M3cxM3FDcld1L0hKOWV1?=
 =?utf-8?B?N0pCUTV2MzdPOER5SkNHcEtUc0xTMVB4WXNHblNuUE4zSitnckF0dXk4cXRR?=
 =?utf-8?B?aEpoNHlJb01nQ0FkcGhscUxOR3dyZDZqakxoYThUSzNMK2d4T3dsYmQ3YkNk?=
 =?utf-8?B?ZHNmWnlqTzRkQXppMXZNN3BzQzM1aG9DSkFadEE5L3U0dE91SmpQMFhYWGNQ?=
 =?utf-8?B?QWpkVkwrclh3NWNWQ2tiS0pibkN0eGc0UzYwbVRLYVNpL2JKUUEzaHowdVJS?=
 =?utf-8?B?Z1huMG4vZ010Nkg5Sjg3RGNGck5pYm1oWEF2cnF3L0JMMnlxclQrQjlvczkw?=
 =?utf-8?B?SVlwYzA0VFZubm9jc1VMaG9WaFFZNmE0UnVGejJuUldQMFdKTEVXQTRqQkpE?=
 =?utf-8?B?NzJaRTQ1akVtUEFjY21xYWxpQ2d6dFQ5a3UrbFNnZlVya3NtZUpZaUxWR1Qv?=
 =?utf-8?B?YytCOUVocjhpZ0g1M1dKQUJQTE9mSDIwQmJNVXhua1R0WGxYVFNFQkdjdTNZ?=
 =?utf-8?B?cDF5RmpnL1RtaUlGcGh1T1I3b3hORDVCMTkvYXhjWlU2M3NGV3dEb2VKOUo1?=
 =?utf-8?B?YTFXbWtiaGVmOEtSeE1HbGdBbnUxMHV2dDdXRmp0R3VsLzhFWTZZNVQ0Yk5I?=
 =?utf-8?Q?vGKObTdN1dBzjkPPL9OIDQTew?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c9sW+DbBbkwNTQTxLMLjM+fz9feBkElfU8E1VEwTz2jsCkcxnMbetocisbWmUgOdAQYLh9zwbd4TuavXsxrteOkcIENKG0Qc1QQPAsydXuz7ASLQf96NAtix1JE1otLeU3x1hpea2vOrKcUkK94o4Zf8cEsPdcy+jAtK80Vbprj0MRYhDvrre98uaLzBOhIPt00mrlNnALzwMgJJI7n6uL/XIL03AQIpIr0cJ0J9ZnnJ0zcdPcPcN5eoCy5BN0vumXoWw4LF0Co/XEwC1dMs0RsMZ7oZ5PrJBkA1/C1hfrGoFr+UycWInu3tmUre9TTyIuKaVKwin2T6iQ1Pw1UFHv4Qevi+TIgxrKoYKe7MuY66SUbE7a0zJps+so3bIYLC0+GUqxlS99zqYtkKd2RjUmtI0hQqdZjAVdR+UU0XNXD7xNW6L4FRTa8I2Wuj+67WUzCJUINw6WN+s4PtGIZG9gRqg5BD/O7tn64+UxjtuhSFbOeX3pMkTsVGYctkM2bcf1SgDH3zGx1TAFZACPYa5DAWFE6dMteQ+qXyqRgA4Okrvrl8MvkdgbQYjGTNdI6EcG2M7bASHwipVmaSkcBMp/H/K9Y63Suzpu80Ht9ciEo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358dd413-0ad2-487f-82b7-08dddc1af879
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 16:44:15.4608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRnJDjSlKttuZpKBw7SmWuM3QC0Z3Nq9iNGnJ/fsSaIERYuoUyIbNaEfA8kHktX2Uvn62WmVSfrnlW4de5yj9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4874
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508150138
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689f63e3 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YBg5PAQxHKg7ObuplksA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4TDQbCSBFo_TQmB2beRhm7mzE7JjDuoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDEzOCBTYWx0ZWRfX5hS29VkHNp5S
 agVDv8/oJ9zvq6jD2ih1R3am/de6J1pOtTv420xPXhHa+A/L5+921M54PpOeYsn3VxRKR/qE9rn
 vZDuZ9Exs8+ZbXDhPz70FSe7a9Ark+UvhOQyMQlqNTb3HzFeSZ1xN8aZ9RlpL8baqpjTvgBUmm4
 T77c/NPlG0fBExoPG0JHU0uYPOWyBRrvTjhJ/WYpTF37duJvHWA+7Nz0rwS343I5+KK1GIrs8a4
 XEU+IeGTW0EUwO5zETtwB+tyMso4wZwfw7OTQZzZLvexn+KwP9vPl73uLtDGTYTfvwQ1LSPTHwR
 Um6Pb4jaZsS6p7WJYGLsbtH7O5l5/+tOcJ8Kdoi+wsXS7exNpudkdA/E1/jDFQZcauIEs6n6kJE
 Wu3CJA7o6uYaRzTCrQFbmJ35k9pmjrmwXJcDHg0F9sq4PZaz0v9uxXtCk8dw6VbM+F+aS8ZJ
X-Proofpoint-GUID: 4TDQbCSBFo_TQmB2beRhm7mzE7JjDuoy

Already R-b, but ack that with the latest change the four tests now pass.

On 8/15/25 10:55, Kris Van Hees via DTrace-devel wrote:
> Only USDT (regular and is-enabled) probes need populate_args().
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   libdtrace/dt_prov_uprobe.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index c63d58383..07b26f20f 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -986,6 +986,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>   		upp->flags |= PP_IS_ENABLED;
>   		break;
>   	case DTPPT_USDT:
> +	case DTPPT_STAPSDT:
>   		upp->flags |= PP_IS_USDT;
>   		break;
>   	default: ;
> @@ -994,8 +995,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>   		 */
>   	}
>   
> -	if (populate_args(dtp, psp, upp) < 0)
> -		goto fail;
> +	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
> +		if (populate_args(dtp, psp, upp) < 0)
> +			goto fail;
> +	}
>   
>   	return uprp;
>   
