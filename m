Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7842C1B4123
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733441009; cv=fail; b=XZYyPXabC0hWpQdNm3bCyUovy322GrYrN8bAHyBt+hL8AA33NG8+mT7rkR+8eVXzsjVtpuXCevmTkMbqVI049gZZMWX78WyAGcVCtWYvU6AbmDus4ND8NaFjwtX1R+s/B/bm2WmnWdra1EUGS32+5ieSdEO0Md3/ZywfJJDlKJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733441009; c=relaxed/simple;
	bh=Kb6Olalxq2ihp205O7hGtKMOeEeB/uMEVWv9WJ17U3M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KRSZGuiTRM8q6CWMgmqYg0zO/fvSYQXXEtD4XeVueXi413l3cTTUEyKBD05xYrbTcYMRbn2+ey4/2aIp3+Uc3yMs0wbZa0DJ0JbTyyF/li5FNHYy1cWI1YZzg74YCA2F98V3jw2vzchSQk+HhUgiev526uO4oKs/Codh7DwHIQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cVbo7azi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q3QyrGyD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cVbo7azi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q3QyrGyD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNW5h025656
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=F2h9i6mW6Q0S8BcyHGXH2f8KeMbvcE/OsG9qDV1gDjE=; b=
	cVbo7aziqaZjUPmCaTQG4RGFkWAEWOfg/CBvQH5y84JyINc7TR3/pr3zm+iQ4/Ci
	Eg8qlS2HcbyH7SisjzBuA28V1Uio3YKadQXVmG9ERlzOcH69Uap4ljr3MIS04g4r
	Qf1JIgWJGOhhHhqe42vxLwgeDLubckxOFDHiPjSVPdv5JjsttOtOU2m+hZ7WKtXq
	h7e/Bfk7DjU0mPSnzZgo0vKLHg1wcUWmEIcH5hq98tklv7Ip+bsVlFSYrUAG5awQ
	YJVdki7/V5MwEVic0TRcMkQ1nKnpBzkvce3t5SdSXjo3w6iDSzjYlbO9QGhUQFQ7
	kP0Q3D7iiAj9YV6SeuCTDg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tasc73v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:23:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5M0RGO020378
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:23:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bks51-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:23:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM4+EiEqhWF6iAgnSQd7lxMHorm0l1sqi/ylZSveEjvYB48ZXJlr8TolLqP4FB9x7YJ9n2NTl4Oo9aynnGfzjwVFun8j/JVbWRTMsMLCCoTqTu4oGjelRomUfo4NMcghqsOevgE8Lpqv5sKxJyNYUkzuL0GYM5N+gPMY0E2NvNZGf4U6/E/eHuxW6Yb3j+FXiFiUmGFtmsX4hdyFr6Ymlq6qGazQjA4ceBiIvJcOmDjulntBIJSdzAm+faxSf/ow0KNJHkR3aDNzrlWo49bqKGCYJWoTKWizH+cXuUbifvXBRqHsz5LKt/UfMqXHREWrYKjvFiF6WZ4sv+vDV5aGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2h9i6mW6Q0S8BcyHGXH2f8KeMbvcE/OsG9qDV1gDjE=;
 b=UCec6XBi82MG83zeS06icZnmtPQO/fkR1tRvB/Isca98tLyLW5rYtuYIsj5UwmrgrPMhgKYYED4LAzX1LwWMqoYUZvjtU7/vO+ezC5Qaj4X7gNNH2YvFZWjHtoQpEpes5l0GkCRXVG7f19iHTgYjPnQ/MfGRU89MRNye/QFKfox2KSsMxE4d86/IlhFFzI7OdCN6aVF4AEA8BxVL6NTADs+q+D0zl9fGsSSrQh1QhH/c7XnOkd7RgQ/IDvzqym5JsnAIrWmygIMIllxb8r8rDqu/cP/JU1gkQJ24Gr7DLWKpVfgQTpYJE1xc4sbZoQ7P54MF1E/CNc3C90nz+EDwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2h9i6mW6Q0S8BcyHGXH2f8KeMbvcE/OsG9qDV1gDjE=;
 b=q3QyrGyDds7aO6CfNPI3AprWzr8AtkevIG3C/cH+3HjMgyJ9IAf30WgiDHYcx2iaBIHLvpdilMh8GK/YXDFDZUCzRjqEa9kKBN4gNviG+WnqmJRgmkXoFN9JzYuZfMc/YjbASeeD3BJl49R566bTyEJhoyKvnRkgUFVs8BelLwI=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DS0PR10MB7510.namprd10.prod.outlook.com (2603:10b6:8:166::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Thu, 5 Dec
 2024 23:23:10 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 23:23:10 +0000
Message-ID: <47717e88-6c23-b137-4fdb-ef9da7dce8d4@oracle.com>
Date: Thu, 5 Dec 2024 18:23:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] rawfbt: new provider
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:91::12) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DS0PR10MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8c93c5-9aef-451d-5d15-08dd1583c861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OThTeXFYYnZLeVR6R2o0N2wxRk9rVS8wdWdKZDFYL0VyWjlnZ0VBTDdjNEZq?=
 =?utf-8?B?U2VRK1RVQjFLVzV0S1BBRjgza1VNR1BCZjROY2Izc1BEYzdIS3R6d3hnUlJl?=
 =?utf-8?B?SVk5ckQycE5OUTg4Nyt4Ty9iZ3VNZllGdTJobUlVSFozSHZqcGNCWEF1UDRk?=
 =?utf-8?B?UDA2bkUwOWFrT1B2R2tZUzJJcTVSR0orYzNvbndZOE5oY3VCd1hKMVlQa2kr?=
 =?utf-8?B?ZEpTUTRhSFlCU05idEF1ak5aaXZKc2FpOTVJVmtMUlpQamM1S3BWUTlwZ2Z0?=
 =?utf-8?B?Z0pzb3I1b3czbUN0K3BtZXl4OVRKcU94Rit3dmNjN2hxcDgxaW9yQjJrek9N?=
 =?utf-8?B?WHo0WmFrcENjajUrY3g1UjJ1OHc4L0swaGp1U1l4bnkvcjhPRWxyeWdDTkNi?=
 =?utf-8?B?UG90UDI2SlRSaEZ0cjhhK0J3NFNLMlpVeXh2THhDSjNUK2RMYUFnME5IRHNs?=
 =?utf-8?B?NFgraVFUTDhYWkFSazY2ZEhlbDFDV3hlczRNS1NuL3VqSjFXTFAzeGZYc3FZ?=
 =?utf-8?B?VENGZ3FPYmtKZmJFN2tiTVNaVGp3SXptamRqOVBxM1d1Z3N6UjN4SzF3aVhv?=
 =?utf-8?B?cmtGTXYwWmtKTDlWdTRqeU1NRC9ySHRlSW5zSXlIT2s5VVpxNFVaYzVHY1hE?=
 =?utf-8?B?eU5tcDJuQjRWM3diMUpZZFd5MnM2dkVmRlhzeTh4dzNOVFpMMFczYXJmeDRB?=
 =?utf-8?B?UVFDeGw4SGlwOVpqbXdzOTNKZGlQS29mL0NiRTMvbHJUTWtYT0w4TnZ5Mk1K?=
 =?utf-8?B?L25zZEc5QUJHR0lRWU13aS8wYW5oeVlsc3dVVzlUblh2Z215SVBVYi9pcUd2?=
 =?utf-8?B?OWVueTRrTUJHcFNBbzBWM1VNcmZwS0ptYWRXamFtbWx2Y2p5ZTlwZkcvWkEw?=
 =?utf-8?B?bTJadEI2TUR3ZUpuYUp6L3EyV1lJRkZNKzR4S3N4MEFOR2J3UGZQSlZVK1lT?=
 =?utf-8?B?d3I3dmJhamdxRUZjTW5ibXJyMG01ZGNKQWZsRjFoN20xbjJuSEo3RHZrOWt2?=
 =?utf-8?B?YXFvZGlZWmN6WXQwWFNSZDZGUExNTFJtTFd2WlFpYW9FakdjUDV0REtwajIr?=
 =?utf-8?B?RFdYRGdWSHlsODU0YUNNTkxRbFhOenRoMG9xWGJmb0NWbEVKdGt5cUtYZTdl?=
 =?utf-8?B?ZTZ2eGRYa3I0UGNHQ1phckJFd081bW42K1ZydzF6SmNUNXVUNTBMS2NBMkV0?=
 =?utf-8?B?Y1hnY0hIR2ZTZHRlQnlJSFZJZlFtYXFONEVhSEFoZ2RMcjJJdHMvMHhLckNC?=
 =?utf-8?B?UUZXZk5OUG9lQlV4TmEvY0lzZW9MSWRob05jNzN6VjYrbGNwSjlBdkJoWEdK?=
 =?utf-8?B?SkFnd1NWeXBIU2xXbFExdFFFYkFXMFZxWTlBWVRrL3YyTmNVK2JYOXUvd0d4?=
 =?utf-8?B?eU5QV3VXK3RobUl3YlFuWk1jTGhZUFR2djNkdkhVYkhpZFdyWVBPUFk4NFpt?=
 =?utf-8?B?R3ZTVDZhSktMSzVNelE1RStxVmkvQ1l5SDE5eTIzdWhQRnYybFk4ME9FVnJt?=
 =?utf-8?B?UUZBZzZreExEQW5pdnlTbFYzdUY4SCt6cGtkYVUvcU9Gb0Fod1N1WXkwQ2Jl?=
 =?utf-8?B?ZVB4RlpvWTl5dytsRUE2N2poMTdVaDQyajlqT29DWlFTMnNzVFV2VG02R2cv?=
 =?utf-8?B?ejdBaytXWmtpQjhsRlN2SGgzVFE2RVVnWForV1ZMeE9QTFBOampNN3FManRh?=
 =?utf-8?B?MUtQSzg5bTZCTEFqKzBMYUVvaXBEL0JyMGwzcUtwQnhYNlR0dDRmSHExOUdo?=
 =?utf-8?B?dStiNEhmU0dWWllGa096RGs4RENMY3dtUWErTHUvODRPSSt1dHh5MlRZMGNr?=
 =?utf-8?Q?OTTZ0nI+NzK/yNsFnHHnB5kiBdjBbeWfMcxzY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlEyY3dXL3JOUHFHNjlXdEY4MU4wdEw4WnloNU1QaG95UE0wUkd4Rm96cDh4?=
 =?utf-8?B?SnFaQmpKb3VwMlZVbVlGK0ZVdjhzYkIxSWwxcC80dUNDNEEvMG9ZN0JuRTlH?=
 =?utf-8?B?bVZrUlIyYytNaytSTWxGM0U4dlI3VFBOcnJxT1NXdjBVcnpNWnJ2NGRwakZ0?=
 =?utf-8?B?SFBIMklIY1BFbmRJd1hDVng5K0orMlFDSTJIWFJvWnlITFZMS3ZBYWRSTW90?=
 =?utf-8?B?RkJTZU82TDU5VTVwQzdNNy95d2ZnZVQwM00vU3d4YzdCdGhuamxoK25Sa2Q0?=
 =?utf-8?B?a2diZFV6WEF3YkttWGNPeHZCV1VON2hCdWlFVFgyTVdwR1JjcE1UakZPUDZ2?=
 =?utf-8?B?UkRxTnpqbGJwcE0wVWRUVjVGOHJqN3FZZlZvQVl3TmJCNmdkNXU0WXNvM2FH?=
 =?utf-8?B?R0xqRklXZUx2NFBOcFFkd2JSUFpvVXNoVzVaMmpzOURFSCtUOGFMbkNPNVBV?=
 =?utf-8?B?WDJHWU12ekpqb2luNWFDZ1VNRkpobjJQZ0V3bWRXOFhyaW95VEJvU2RUNnZC?=
 =?utf-8?B?ZG9UZU8xTXFOU0J2Q1ZacWRETlV5dk5uZGFrWTROZHVtNFEzeTlQRzJtTVdR?=
 =?utf-8?B?aE43ZU83ZHlmU0luYWx4eDdMcUlJbyt6TnJYcVBhQU1tMm15Y25xdEx5d1By?=
 =?utf-8?B?YkRGa2RwSEFMd3lKY2dmVHBmYWdBYisyL0twenpYeCtFNmdDS1VrbkZmRmt4?=
 =?utf-8?B?SGlVR25GTW1PU0dJK1ovM0FNNEt5UzIyS2haQzVRM1hnWEZrTGN2NE1GZHdP?=
 =?utf-8?B?UFdyMkExNm9UVzFwNldIdUUwZC85R3UxNGhNa21DZ0JFdVZWWG95aTJIR2pJ?=
 =?utf-8?B?cGpmc1JOcXU3Tk9qZVdKb1BUcWFkOWxzSk0vSkE2bk5NNzduWFpaY1RIbWQ1?=
 =?utf-8?B?YzRhSzZYdzY5eFMzQUlkSnVQblhib1dySzRraTFvdm9wbFRYMWh3RGlHQUp3?=
 =?utf-8?B?UVJPS25JUitkWFhjWGtyR1NwcERwelRaVlVESzFCUXlFbWFBK2pwbEhWQ1N2?=
 =?utf-8?B?UkVnaW9nZEpMVklWOVdKNDMxTGViVFgwN1B5NDBTeHFpYldmY0RHN1IxWWw5?=
 =?utf-8?B?ZVlFVjdSdVovbkVDV1hxbERlMk0vNkFncjAyYlhlamxhZ2toWkV0VllZaWo5?=
 =?utf-8?B?STk0bFFlVis3djM4N1k0TTRoOG1TS2E1VUVBcWhmOUtIS3lBRC9zYlBtL3dP?=
 =?utf-8?B?dmhveURvY1VNUEdvK0J0MmJLZEVLcXhIRmNJS3lBdDdNMkxoY2IwaHVkcHcw?=
 =?utf-8?B?bm16MS8rV3JkYXNWQktndVlJS2RKeEZ6Ti9yVk5SK1VEc2NaNWRCc2VxbUdP?=
 =?utf-8?B?WjVyNXo0aVVsZmlMSDBORi94bGhEVm9mT2xmQjZ2R2JPQ0N1dEk5aUdNR0Vk?=
 =?utf-8?B?QmlSU2drb095R0ROZlN5eThxb1l0YTc5UnFnVE13SG5BaitlaG82YTFGUGFP?=
 =?utf-8?B?N3NuVmhUeWl0SytFN3ozL2lzdXhlQzZBZnJsQytIRC9zcUpjd2RYWTVZQ1FN?=
 =?utf-8?B?Z0lLVGE1VUtjdXd0Q2lkUW5SRWQ2dnBrUjBnQTJ3dHIvYWh4NU1zdzBLKzc3?=
 =?utf-8?B?UkVTTXd4bUc4NWNIdnpHc3RwODJQaGNKaVFkdEl0MnFQVWVQN3pQVndyczVj?=
 =?utf-8?B?blV6dUdpdUN4Qi94bG53cVJQR1lpaml5K2VucDUwY2M5TGdPV3pybDhxeGtX?=
 =?utf-8?B?TjhWMHZLdW5EQktYOUdBZmxwcTZKZVhJS211cHJTV2pLUmpVL3NnOG1tL3dz?=
 =?utf-8?B?UXNlV2NnWVlJY2hJWjMwMXJFcndqcjRZbXUxR0o5VHhWV24xdFd1QTJ0bndO?=
 =?utf-8?B?Nm8va0cwd05hbEFxdzFzZUhtOUVGMUZjZHJwN3hhSTFBTkRVWFBNVXVYbFF4?=
 =?utf-8?B?cTBzd28xRW5LZTFLcU81dTdXVjdabHFYc0VuNlIwQmJTbWhmSzlQQWFYK2xI?=
 =?utf-8?B?Umpyd3VCdUxmdzBlVHNIdi9iTEtIdDkycXQ0WUJoNVFidXZQeEpQNERHK0pn?=
 =?utf-8?B?ZlB5cThZTlN1M3BYcE9vVkh4enRUNzFkVllvRWxqNUV1UElWUU1qekpzMy9E?=
 =?utf-8?B?elArSHNCQzROVUNQektTSGJWWVdZY0RRc2hQWTJHZHY3OEc2N3gyNkNraFM2?=
 =?utf-8?Q?/0Mi3fXTXdeddfoysgZzpjSyD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lJOzA2EP4G+h+WcmXAPqOtg5JJjTlcX/UQwOjpjDrMc+YTcfMPhlI8jil8FH6g+kaXrW7sumPiUY849l+y/73+9zA/G4HNTf1ZL/i8g0bl41OqhUwqIhHCMqXg0enOKj560zNMNvD6NrRt4MLLzpsaMw/c1mngpzH6R8kqWPiz884+spFGq97xAB0dOoOiNzCuVWCblfZA5MBInYnuWVHfOR2JpjOfZ7v1EsxUyzc/LQxLjylId6/4WH3LmS+91cSHedKiGpdLdAAZQCSzWyEFXvJwph4u/MugfeQ3pfV7F4Y4o6CTlJbatVlIdPE/SoeJtXNArHyVjAfIFzeiQjauMdgdOjWsC7ocGoEFrXDOt10EDgWw4VfCsxsyo13CUvYgdugyXkXCZWLQi4xFc0CfNnFiadFkTtfUn2autbIx26yZpqKzGxSiIYf0i7piP9VRBmcErdH1IlDLSat8SbOQFo488CqMLO/vg7LMqKMU6vQQCI7Walrmo/JBIT5Sy74jljXxeUFwVpxhNVqXN8TEIlvta4FNjw8EDhICzyHt7oOiz3MFf6WIswZ4wvlZTWS0NwV83ppqc563H8Bk57NvxX4aoM4htt+cEv7MvdEJU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8c93c5-9aef-451d-5d15-08dd1583c861
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:23:10.4981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqVQsMZC2zzw5d4/PU3WJwB/leXeZ9JDkNLg9A+7f1JMeehdrK67kR+dHntwasQ+OYx3echeDmpad17zHv5ojQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7510
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050175
X-Proofpoint-GUID: BNEXS62Go46AZAOfuUUNv3G_d6ZSCJlr
X-Proofpoint-ORIG-GUID: BNEXS62Go46AZAOfuUUNv3G_d6ZSCJlr

There are a lot of comments below, but presumably they will be easy to 
adapt.  So:
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Anyhow...

Add comment in the commit message that this is the old kprobes provider?

Should there be a test?

On 12/5/24 14:42, Kris Van Hees wrote:
> This provider provides access to all kprobe-based probes that are
> available on the system.  This includes any compiler-generated
> optimized variants of functions, named <func>.<suffix>.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
> new file mode 100644
> index 00000000..edfd36b4
> --- /dev/null
> +++ b/libdtrace/dt_prov_rawfbt.c
> @@ -0,0 +1,330 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + *
> + * The Raw Function Boundary Tracing provider for DTrace.
> + *
> + * The kernel provides kprobes to trace specific symbols.  They are listed in
> + * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
> + * a symbol in the core kernel or with a symbol in a specific kernel module.
> + * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
> + * provider also provides access to synthetic symbols, i.e. symbols created by
> + * compiler optimizations.
> + *
> + * Mapping from event name to DTrace probe name:
> + *
> + *	<name>					rawfbt:vmlinux:<name>:entry
> + *						rawfbt:vmlinux:<name>:return
> + *   or
> + *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
> + *						rawfbt:<modname>:<name>:return
> + */
> +#include <assert.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <linux/bpf.h>
> +#include <linux/btf.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +
> +#include <bpf_asm.h>
> +
> +#include "dt_btf.h"
> +#include "dt_dctx.h"
> +#include "dt_cg.h"
> +#include "dt_module.h"
> +#include "dt_provider_tp.h"
> +#include "dt_probe.h"
> +#include "dt_pt_regs.h"
> +
> +static const char		prvname[] = "rawfbt";
> +static const char		modname[] = "vmlinux";
> +
> +#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> +#define PROBE_LIST		TRACEFS "available_filter_functions"
> +
> +#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> +#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> +
> +static const dtrace_pattr_t	pattr = {
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> +};
> +
> +/*
> + * Scan the PROBE_LIST file and add entry and return probes for every function
> + * that is listed.
> + */
> +static int populate(dtrace_hdl_t *dtp)
> +{
> +	dt_provider_t		*prv;
> +	FILE			*f;
> +	char			*buf = NULL;
> +	size_t			len  = 0;

Extra space before the =.

Incidentally, nice catch:  n was being used for two distinct purposes:  
counting (for which it was uninitialized) and buflen. But then shouldn't 
this problem be corrected in the file where it originally appeared...  
not to mention the other files with this same problem?  That is the 
pre-existing problem exists in:
     dt_prov_fbt.c
     dt_prov_rawtp.c
     dt_prov_sdt.c
     dt_prov_syscall.c

> +	size_t			n = 0;
> +	dtrace_syminfo_t	sip;
> +	dtrace_probedesc_t	pd;
> +
> +	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
> +	if (prv == NULL)
> +		return -1;			/* errno already set */
> +
> +	f = fopen(PROBE_LIST, "r");
> +	if (f == NULL)
> +		return 0;
> +
> +	while (getline(&buf, &len, f) >= 0) {
> +		char		*p, *q;

Okay, but q could also be declared in the innermost clause in which it 
is used.

> +		const char	*mod = modname;
> +		dt_probe_t	*prp;
> +
> +		/*
> +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> +		 * The last line may not have a linefeed.
> +		 */
> +		p = strchr(buf, '\n');
> +		if (p) {
> +			*p = '\0';
> +			if (p > buf && *(--p) == ']')
> +				*p = '\0';
> +		}
> +
> +		/*
> +		 * Now buf is either "funcname" or "funcname [modname".  If
> +		 * there is no module name provided, we will use the default.
> +		 */
> +		p = strchr(buf, ' ');
> +		if (p) {
> +			*p++ = '\0';
> +			if (*p == '[')
> +				p++;
> +		}
> +
> +#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> +		/* Weed out __ftrace_invalid_address___* entries. */
> +		if (strstarts(buf, "__ftrace_invalid_address__") ||
> +		    strstarts(buf, "__probestub_") ||
> +		    strstarts(buf, "__traceiter_"))
> +			continue;
> +#undef strstarts
> +
> +		/*
> +		 * If we did not see a module name, perform a symbol lookup to
> +		 * try to determine the module name.
> +		 */
> +		if (!p) {
> +			/*
> +			 * For synthetic symbol names (those containing '.'),
> +			 * we need to use the base name (before the '.') for
> +			 * module name lookup, because the synthetic forms are
> +			 * not recorded in kallsyms information.
> +			 *
> +			 * We replace the first '.' with a 0 to terminate the
> +			 * string, and after the lookup, we put it back.
> +			 */
> +			q = strchr(buf, '.');
> +			if (q != NULL)
> +				*q = '\0';
> +
> +			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
> +						  NULL, &sip) == 0)
> +				mod = sip.object;
> +
> +			if (q != NULL)
> +				*q = '.';
> +		} else
> +			mod = p;
> +
> +		/*
> +		 * Due to the lack of module names in
> +		 * TRACEFS/available_filter_functions, there are some duplicate
> +		 * function names.  The kernel does not let us trace functions
> +		 * that have duplicates, so we need to remove the existing one.
> +		 */

This represents a change in behavior from fbt kprobe.  We used not to 
create the new one, but here we remove the old one.  How about a comment 
on why the change.

> +		pd.id = DTRACE_IDNONE;
> +		pd.prv = prvname;
> +		pd.mod = mod;
> +		pd.fun = buf;
> +		pd.prb = "entry";
> +		prp = dt_probe_lookup(dtp, &pd);
> +		if (prp != NULL) {
> +			dt_probe_destroy(prp);
> +			continue;
> +		}
> +
> +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> +			n++;
> +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> +			n++;
> +	}
> +
> +	free(buf);
> +	fclose(f);
> +
> +	return n;
> +}
> +
> +/*
> + * Generate a BPF trampoline for a FBT probe.
> + *
> + * The trampoline function is called when a FBT probe triggers, and it must
> + * satisfy the following prototype:
> + *
> + *	int dt_fbt(dt_pt_regs *regs)

Should that be dt_rawfbt?

> + *
> + * The trampoline will populate a dt_dctx_t struct and then call the function
> + * that implements the compiled D clause.  It returns 0 to the caller.
> + */
> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> +{
> +	dt_cg_tramp_prologue(pcb);
> +
> +	/*
> +	 * After the dt_cg_tramp_prologue() call, we have:
> +	 *				//     (%r7 = dctx->mst)
> +	 *				//     (%r8 = dctx->ctx)
> +	 */
> +	dt_cg_tramp_copy_regs(pcb);
> +	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
> +		dt_irlist_t	*dlp = &pcb->pcb_ir;
> +
> +		dt_cg_tramp_copy_rval_from_regs(pcb);
> +
> +		/*
> +		 * fbt:::return arg0 should be the function offset for
> +		 * return instruction.  Since we use kretprobes, however,
> +		 * which do not fire until the function has returned to
> +		 * its caller, information about the returning instruction
> +		 * in the callee has been lost.
> +		 *
> +		 * Set arg0=-1 to indicate that we do not know the value.
> +		 */
> +		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
> +		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> +	} else
> +		dt_cg_tramp_copy_args_from_regs(pcb, 1);
> +	dt_cg_tramp_epilogue(pcb);
> +
> +	return 0;
> +}
> +
> +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> +{
> +	if (!dt_tp_probe_has_info(prp)) {
> +		char	*fn, *prb, *p;
> +		FILE	*f;
> +		size_t	len;
> +		int	fd, rc = -1;
> +
> +		/*
> +		 * The tracepoint event we will be creating needs to have a
> +		 * valid name.  We use a copy of the probe name, with . -> _
> +		 * conversion.
> +		 */
> +		prb = strdup(prp->desc->fun);

strdup()... memory leak?

> +		for (p = prb; *p; p++) {
> +			if (*p == '.')
> +				*p = '_';
> +		}
> +
> +		/*
> +		 * Register the kprobe with the tracing subsystem.  This will
> +		 * create a tracepoint event.
> +		 */
> +		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		if (fd == -1)
> +			return -ENOENT;
> +
> +		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> +			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> +			     FBT_GROUP_DATA, prb, prp->desc->fun);
> +		close(fd);
> +		if (rc == -1)
> +			return -ENOENT;
> +
> +		/* create format file name */
> +		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> +			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
> +		fn = dt_alloc(dtp, len);

Use asprintf() instead?

> +		if (fn == NULL)
> +			return -ENOENT;
> +
> +		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> +			 FBT_GROUP_DATA, prb);
> +
> +		/* open format file */
> +		f = fopen(fn, "r");
> +		dt_free(dtp, fn);
> +		if (f == NULL)
> +			return -ENOENT;
> +
> +		/* read event id from format file */
> +		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		fclose(f);
> +
> +		if (rc < 0)
> +			return -ENOENT;
> +	}
> +
> +	/* attach BPF program to the probe */
> +	return dt_tp_probe_attach(dtp, prp, bpf_fd);
> +}
> +
> +static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
> +		      dt_argdesc_t **argvp)
> +{
> +	*argcp = 0;			/* no arguments by default */
> +	*argvp = NULL;
> +
> +	return 0;
> +}

With d44036087 ("probe: probes in providers without probe_info() have no 
args"), such a probe_info() is no longer necessary.

> +
> +/*
> + * Try to clean up system resources that may have been allocated for this
> + * probe.
> + *
> + * If there is an event FD, we close it.
> + *
> + * We also try to remove any kprobe that may have been created for the probe.

kprobe, yes.  But that fixes the "uprobe" typo that was in 
kprobe_detach().  So, how about fixing that typo in dt_prov_fbt.c in 
this patch while we're at it.

> + * This is harmless for probes that didn't get created.  If the removal fails
> + * for some reason we are out of luck - fortunately it is not harmful to the
> + * system as a whole.
> + */
> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> +{
> +	int	fd;
> +
> +	if (!dt_tp_probe_has_info(prp))
> +		return;
> +
> +	dt_tp_probe_detach(dtp, prp);
> +
> +	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	if (fd == -1)
> +		return;
> +
> +	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
> +		prp->desc->fun);
> +	close(fd);
> +}
> +
> +dt_provimpl_t	dt_rawfbt = {
> +	.name		= "rawfbt",

Use prvname instead of "rawfbt"?

> +	.prog_type	= BPF_PROG_TYPE_KPROBE,
> +	.populate	= &populate,
> +	.load_prog	= &dt_bpf_prog_load,
> +	.trampoline	= &trampoline,
> +	.attach		= &attach,
> +	.probe_info	= &probe_info,
> +	.detach		= &detach,
> +	.probe_destroy	= &dt_tp_probe_destroy,
> +};
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 1e2e844e..0c621197 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
>   	&dt_lockstat,
>   	&dt_proc,
>   	&dt_profile,
> +	&dt_rawfbt,
>   	&dt_rawtp,
>   	&dt_sched,
>   	&dt_sdt,
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index f62137de..59a8d62e 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
>   extern dt_provimpl_t dt_lockstat;
>   extern dt_provimpl_t dt_proc;
>   extern dt_provimpl_t dt_profile;
> +extern dt_provimpl_t dt_rawfbt;
>   extern dt_provimpl_t dt_rawtp;
>   extern dt_provimpl_t dt_sched;
>   extern dt_provimpl_t dt_sdt;
> diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> index 8292b309..16052cbc 100755
> --- a/test/utils/clean_probes.sh
> +++ b/test/utils/clean_probes.sh
> @@ -70,7 +70,7 @@ fi
>   	     { sub(/:/, "/"); }
>   
>   	     {
> -		 if (/_fbt_/)
> +		 if (/_(raw)?fbt_/)
>   		     kpv[kpc++] = $0;
>   		 else
>   		     upv[upc++] = $0;
