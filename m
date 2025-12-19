Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BE3D76
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766103072; cv=fail; b=u2KipKP26iALHZVjP/UDXxxrodjYx0dGwyHr1ehJteyA5KRlpeUOf7IdQJOQW+Wm7D/DMxi1SLX2FF8/ZOVerHIVWnInAbwV792ZIDRmXs/ctCvN/Ha/fu9pmufuHmtFF9BoxnF8esj47N+feDzcxzgkV/YYfIO6gUzgE06iQq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766103072; c=relaxed/simple;
	bh=Z9qpC/qAJ1jnZD3xEUmy9/A3MUEfJYkgkkXT0WwVg+Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WvmnfYddczyaQc4qFq7e7i+hahTOcz0iH6kvxDzoh6pEEMS4Gunm5r6yw3j7ZchV+/us0UfAaCnQNM5LQc60YDfX87jeNjKCPKl1UhVUBF0HPBYjYvsuL/vdnYVFohEm/B3YkBp84yasR714gl2d2UgXMIJMrvlH7ORuV6tNdsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JLiCwdVL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CuEVRTCI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JLiCwdVL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CuEVRTCI"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkS2T1671112
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=YFJvHUTD+pO+0c4kgarKfanJw4H0c00qurecoSiLonI=; b=
	JLiCwdVLy4sPGo3N0g7cm2tHC0knGj9mZesiA5fYeV1kZKCRvyArbV/YWetstppt
	J5GcPRY0ZLJqXk9zXnOWhkC7gMBlMFLDKMtDT6yqDwZ9S9rvM0/z/GlsQ99Q6Tv4
	p0cJAPK8Xg9QC33Cwcz+rOGz27hHZ3FvPfGNv1iFk2vJv4DSagE84S4bqeqjfgYq
	WzAxZReuDrWbu5Q0pHQxY1eutDJIPdMXuxBab836MhC3KsmH80xXejwaYBqc77u6
	645Ii81wmDrg6fafdEjlXhzrAe9DxkPDhI6dftSsomniaXQAfpdR2oLDjia8aoX9
	iv7MKLXWCB8HmvQn3E79DA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2f09r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:11:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BILUf4B014131
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:11:09 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qth86db-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:11:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2AhRj585CUqEhq9zAkz5rgRBC7IFoc6MpKXua8vVyxd5bENSMvKuNElFQuNFe2RLLISOJngP/+HBzTD1hD7Z38fjdUOlJ6YPPZ31qdXi3GJPh2msJbtPXITrrKuSaugggX/RHZIWUMRo25KykEnieII+upPliR5hBlYPjxg+JOHPByqO7mwAEbL8ci2Fwn8FOaadTHaQLS6BcEcHPw9NhIj0Ba1PR0iSZ2iaOlhJqrRY3qWyzG3QsAvs6gVOYr/yWMUL6FX2GNwytkaindek5lgnf+87/xG1JQaGWf5MU3naoR/VKVnaIW4n4QcRHHbLddg6yFPEBritkk5lcUzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFJvHUTD+pO+0c4kgarKfanJw4H0c00qurecoSiLonI=;
 b=aPKc2s8/YHjr1TltvzGtCLdOgkksWfmNYmlWgmsPoFYORdEiPt6x/NOqa/Q0ej/F+p1G1b0zDjvzUE24fkX02lr0g5q+9mdaHTjLWoUeFQsl77fWnEWKQfOYlXiiBVX9RgXhCdSi9BW37Yc2SZ6j8sl0HFwkX1KhK+5HYzo8cp+wcm/bE5mvzykANjdyVlv/eUaEclAN+qlDudBHAXiOVWKm61DStyngvQhr/WdVkPBXk5OMnrru42KvO5IpYJ3RcNyRUFVaJsW6rIyHk5qfJkpLu0QWE0iqGw00Py7y40MKirrrakylsv2RIG8MWEjvXcn06Pgxf2ooRM/24pux0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFJvHUTD+pO+0c4kgarKfanJw4H0c00qurecoSiLonI=;
 b=CuEVRTCITJYG115HFZsUsHsa1N8jMIJQTvBFmsMlBWl+G2WwLxk2uLy4U1EREo1KdrtD1m4nVUHM8s6yMDDSNvpqUVvwngntwbz3eEb5WCTKZOTJse6aTZTN7y+mH9soodE+bl0A5gGRXHyCSQrN5lF8Gq2AlS0j9/Uc+m/wW3Q=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7432.namprd10.prod.outlook.com (2603:10b6:8:155::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 00:11:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 00:11:06 +0000
Message-ID: <1a2bdc51-d57d-c112-61b6-5a03e8ed8f52@oracle.com>
Date: Thu, 18 Dec 2025 19:11:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] test: correct file permissions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <afcf46e3-ed97-8bd3-7bb1-8268df5660cf@oracle.com>
 <aURhb26qwDFCqmKk@oracle.com>
 <a824d48f-d280-3376-94e0-998373a63855@oracle.com>
 <aUR7t14bRn8MnGVH@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aUR7t14bRn8MnGVH@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: acbc1e57-edec-46e7-978f-08de3e931aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek5iYU52bTJYaEJaSllWUDhpb3JRT1R3bUE2OWkraWR0eW42VmI2ckdCNER3?=
 =?utf-8?B?N3VlTkpWT0xtWVZuRjJuY0pCVHhTRlcyVWRQWHFYRENmNlV1NnhESWs5MVll?=
 =?utf-8?B?N2pna1k3b3RzajNiYjJLWm5ycWlBOXA0WllUZHhMTG1XcjVZUVpCQUhvVGVV?=
 =?utf-8?B?TjVMWGJickc2K2JTd2VGWmdoMWk0VlZIYnBiajRCMjJTRE9PbEt6cW9zMVVO?=
 =?utf-8?B?RksvYlJJQkI5aHdpRnE0WTJYcTd4dkRBQmtraHNjNEdib0FIeEVDUFVIVTZB?=
 =?utf-8?B?bWR3WHdxL2ZQUXZqeGZFMzhQeWUxWVJOV1N0SHo5Z0JsKytIcXVZS0NNMkhm?=
 =?utf-8?B?RCtPQXgyQ1hTdVU1Qk1lZkN1d201NnBXdnpBZ25NSGZ2OW1NU1doUjJzcEFD?=
 =?utf-8?B?QzNsTFdUSUQ4WEViZDVjODhEZkhYR1hGNmZyNHlNMHVwd1Urdk5zVnRBMDNp?=
 =?utf-8?B?ZlZnNHBoays2ZEZtdVNML2cya2oyMzdMbW1hZzFSNmk1TmJzV0s3SWxwM1ZY?=
 =?utf-8?B?QS93UUtua2hJb2tFcVJOQ1JBRjJmK1p4dWR6SnhJK0h2K3hudVFldk5HZ0hF?=
 =?utf-8?B?UnkvK3VhdnUza1pFbGpCdStaTVV3ODlQMjhiaXJXVDBneTZlb3FhekNBMDdQ?=
 =?utf-8?B?L2gxSUZZd1BBb1UrZk0vdk1SUUYvK3NjWHB4aEVGRURTTGpFaUxHQnBheEVn?=
 =?utf-8?B?K01Nd0x1aWZ0YzJLMDVmNWdqTmYxMi9JUkJEMHdiZXVLSmxiMTJ3K2dZR2ZT?=
 =?utf-8?B?eFQxZmdHekF6R3Z1OFpLSWpsTjV4U2VacVl5aXAzNEdPSWpZKzJ0MVg0QXFM?=
 =?utf-8?B?OTdkMDIrNnRlUkQ2SzQ3N2VTdGpOSDhUZmRsWjdEaDB0aFc1WStQYkVjdk5z?=
 =?utf-8?B?VVowMVlNb0QvTXdYWGdqUVRWZ21qQnlMMnZqVFBBcng3UkszNGdVWEZad1Zk?=
 =?utf-8?B?SDZYRm5nR2RqTHNFS2dkRHVnMEZud2RkWGJvak5sSDBLSnNubUJ4RElPTFVo?=
 =?utf-8?B?akNvZHdZNjRVV3FFYldDdEVmVS8yaDF0NU9qd2hucUNVcHFWMy90WTNkMTFN?=
 =?utf-8?B?b2hWemtIS3I2U2RSQmVXcUZNUFY0R2IyOWFlai9CV0ZpZUF2SHlXbEl1ZDB4?=
 =?utf-8?B?MStTUXhFdzIzMDJ5cWVZSGtNOHkzUENmaDljNEJEZWVQdDNyUXpDZFQ2ZlVw?=
 =?utf-8?B?ODBneTk0djZHUnpIcy9taGxwcnJqdUgyd2JnY3ZCZHdIbFkzNHlQTFR3V2lv?=
 =?utf-8?B?dDdRUHlLaXVseUJuQTVhcWxHMGtYd3grUFhTYlpPbjhDWlV4REtlT1JlbTIr?=
 =?utf-8?B?YWs0eVhTRWhVQ0JpQjdHWFkxclpYaVE3UWdhY0ZxdHo0OG9BZzZodloxS24y?=
 =?utf-8?B?akNxcmQ1aU9pOWF2RDBQT1cvNTcyODFqNWNjeW5CVkZ1bmNzVEs1VDRFMzhS?=
 =?utf-8?B?dXZ3WnI1emxYSXRqTWp0Rk1hTUloV0ZLR3hZcE8ycEpRKzVRVUh4QnNyMG1I?=
 =?utf-8?B?c2NTbkp4aTR0ZEVnVy9NNHRYVDZFVFZLYlAvcjY4YTkzaDlnRUx0RmIrSGxY?=
 =?utf-8?B?QStzRUppWWY1L09TV0xzTE5BMzhIK1FyeU5RQzlVN2JGUlRRdDhWK1BJK1gy?=
 =?utf-8?B?M2JrN2pMYlFjZ3VDRGxpQXZBL0hSdmpndk5EL1Z6K2k0eE5YeEpXN1Q4aFR5?=
 =?utf-8?B?b2NNRFJraVZuT3BnQXdCYmx3UlNSZUJKUTdvZzV6ZjlJUjlJbVN2bUMzRmJF?=
 =?utf-8?B?cUl1MVFEazBrcVJmcUdkdThRN3VOY1YzQ0lZak1TYUhlNkJSazZacTIvYW0x?=
 =?utf-8?B?eHdXaFc3UGczTElpOXlVaUFWbDhaYVQwZlNBTjdXU0pxREVaa1FsV3JqVTd3?=
 =?utf-8?B?T1pTaS9VYkViZ0JkVGlmaGkvS08vTVVHWVk3dEo2N0s5QStSZ0JEQlZUaVZN?=
 =?utf-8?Q?yoH6y1qrp+rOm9NRYg2JgwTjgmt2Wz37?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnEySCt1UlBOa2ZzRFpacEJ3MXFCYUdPTDNGN0RoODFEM2FndnArRnhsQ05P?=
 =?utf-8?B?d1VpeFVJbmYyNnM4dHBUcDA0VDFtR1ZJZ2E4dDBuTFpYS1R5OU1BM0dpbnVV?=
 =?utf-8?B?L1hqanBJck5pODdxUEdHK3FqWUpMRDczYk9JNGFhWFlQVDNoZVdIZk5kTGd3?=
 =?utf-8?B?WTVGVG8zMGpaajQzelJQSXBLbmsxZEtjYXVacDBKUlpnbDJocE1NWDNOZlBn?=
 =?utf-8?B?MzlaRGhVT0RiR1RJbW1LWGJJYnVzejVXZXBFdTIvVGp6aEp3ZXBzOVBUU0R1?=
 =?utf-8?B?Q3NYZVAvOUgvVGdIbG1LNW1Ua25QTnBvL2pCT2lnd2pQaC9jdktOVGtEQ3pz?=
 =?utf-8?B?bFJXUUtsWHVuc3JndFlMNFUyS0ljYStpZ09WVWdpOWVQMUZjWnltNkIvM21m?=
 =?utf-8?B?SkhEdURzckVSL0NncWUzNGN4aW0vTmR5bGpkREhIMVB3ME5CN0M0MGRuQWov?=
 =?utf-8?B?MlpOMnZSZldwVUc2SW1vbS9CcVFIbENuQ3JDanNucXh6cTNhUE5VNGNTSCth?=
 =?utf-8?B?RFNpTk1oRGgrL1pPYWNRVktIb2VsSFppMERCcWNmVVo1VGNSaTd6UHJIQVFh?=
 =?utf-8?B?MXlJY2QwbldsZTMzMVQrWTRBcVRRbDlYTTBoL0tGNlJML0VobnRpcTk2dlIy?=
 =?utf-8?B?cmxFVWNXMzladGFiWjJRSWdjeFVVbVo2SmExbm5uaGl4dmpLK3lhT3VYZXJX?=
 =?utf-8?B?b0tNZjdlYnQwNjMwSDBDR3hkRGlLZG85T2xBQ0lFZjBmWWhHNUg5SlRPZktH?=
 =?utf-8?B?VnVUYXg4RkFBUVVxeHcwSjhzTSs2cVdXZ3MwVGhSMndXdjdGcXFhdHVBNE9h?=
 =?utf-8?B?aUJLWEE2djA1V0RpTDVpbDNtU3dYUnh1aTJ2Zlg0R1RoekpRTVFSQkVFTTZS?=
 =?utf-8?B?TjNYTUhld0RzT0FuYnc5aWIvMURUKzlSbFk2Tks1aTRSc1ZXcU01UXNYOERX?=
 =?utf-8?B?VmNBdlgva1BHNDROVVRXQXh3V2RmMXdURjUwbjFNQ24wQnoyc2w2WWJJbmxi?=
 =?utf-8?B?eU15RGplbzV1dWlERi8zSTlBZkYvOU83dSswRDhzN3NYUE9CcDRpaFZXVGdQ?=
 =?utf-8?B?UWlETm00b0lRR0dxSHNKbS95Rk5uZG1BVnFhV2prTDNVNmJrdjIzek9NeHl6?=
 =?utf-8?B?TjlGT2xxQ0I1b1NTUnJ1UEh3eUdlWDQwdHc4RjcrbmtMZ2FiUjE0bWMwbVJQ?=
 =?utf-8?B?Z0ZGeHBoZ3gxTEg4QUVmNEk4NTVLVmpyb2xJSUN4YWRtUlZZaHdTNUpidU9r?=
 =?utf-8?B?dHZYZ1JOV2JQdmlGZ2tMV0RBN1hTQmNTaHkrYVg5clJXM3ROOCtBUnV1eXpB?=
 =?utf-8?B?bTVVWXh5M2VKb1pLdWFIM0dmNktPSHJ6R3R0WkhCYmRFdnZBMCs1MlRIMGt2?=
 =?utf-8?B?RTlPMEdZQUJ1RHpMR3dIeGxMMHEyYnVRYU05emhWVC93YW5tdDltclV1VmdP?=
 =?utf-8?B?Ym50d0s3cHltWitWbVZ0RnZDTDdlY3dIVTVPN2p6MDNWUmQzajFyL1BSWGtR?=
 =?utf-8?B?cXIwNFh2OTlOakFHZkpxTkVzMWxMTDBkb0FRbFlCT3p2UHo2TmZwSDVzQmZL?=
 =?utf-8?B?QjNtaVpvcFlaLzMyTFV0cWpBcVJMV0pHbmtxZGJDMDFPd2ZMY28wbEtnNE4v?=
 =?utf-8?B?bmJ6RjgzaEFRSVhOL21oOVQxR1VKQUxUSCtQQ0cwNUdvSlQ1dzcwZ1dRRjh1?=
 =?utf-8?B?Ukl6NmZ4QzVoQlp5K2FsWFFDMXlKZE9NR3Exd3V0RksrTW8vTjYyTnJUbUlm?=
 =?utf-8?B?eVlGaytnbXZIWWVpUGIwMS9sRkR5L3Y2UW83S3JJZjVGOG05TXdyYks0NFlm?=
 =?utf-8?B?ZmkxNzkxdUdaOCt4MDBOUFMwYzMwN09PdDRtTk9wLytUbFVzdGRnZ1ZFUU8y?=
 =?utf-8?B?cnV1NGdZbkc1K0ZzUlNNd0xDUXNlV0ZQYmIzM0xraFRpMG0rK1kzSzZndWRD?=
 =?utf-8?B?ZmN1TTdMTU5nRnJLMEJDbmVPY3dPWWJpUlJCbHZKZUw4OUIyVlRuZEZCaXFV?=
 =?utf-8?B?Y05qNjZDaTZHclRlL2hYOWcyRWMwL2FTcUhkZVVWWVQvbUxHblpXaCs4NzVI?=
 =?utf-8?B?OTBKRE1aM3Vsd3pWWW9UOGRsdVQyakpWbEFoNGFtVGZpc2EzaXh5OHNxTTFM?=
 =?utf-8?Q?cGoPokK58FQzOjaxd8t7nb9+k?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W25D6GWDH6LI3sxftuZPtVFfNX161Dm3wIMN6O/Yw5TPIE8j9zQVV6qX3BJgXFRua6KvyyVtjloChqU1YLWlmSkgljbgOkWKWA34wwOjnCJlPsDVwmF6xganyQ5us7om202zgd3KJ0jGB1RuQsVtqUPoL77BgWZxvjfMVcwSJ/yeVYWUNMD87nfqUhynElceiih6yW5u815zhvB6DlW1ivuGmZ0URqm7aCOHGVvb7YMLymnvBSPBYpADLEE0hf9e84u//NQkUH3QWAsoGakHY4mG2Di0IN8t5EZQiGXBRVlG67flp3zf6V/OQCbkygvpmdxa+5V3eKCUvN/8u0GZ/8cF9Is3baIz/qKb602Y+5Fd9tdvJflCiAhQGEsk9ms3Qjx2v0K0ppK0WEEsFoYRxG2lZVYlJRPmfBsfOfuz+x/EC1BpxqpmgoyvhsPSBckDgoCSmw9daQ1A/gJFvnVM9cxRocBEzJSmQDFrglPJesv61Es2AHDf5PEAdBNbWXkfvBOe0fgaXywuA/w2sDKvZkGceRVTvwtjq/pZ8m4vEuHhJ5mQVBV6lTu7yFGNTjKN48nE/C1O0+8qibtnFAgqyXz6kRkLO4C7zsk7q1+kcsA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbc1e57-edec-46e7-978f-08de3e931aa2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 00:11:06.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8D5HDsikyBhv1qTwErDFfgN/0a4O27eA3M/XJP7gq/6AifkfnS4X0pvdl3+GPNhiiPUUxtVgFfgnkbeQ/hjmeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7432
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512180200
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDIwMCBTYWx0ZWRfX+uJD059InvkD
 /1x/u2n43swcljgKt94t13boJzWw6zDVOVIJiyz554xUpFmwax6EZiy5/eDWtkMKQmPS5p3894c
 KTQrCGiD4br2goe/aqH9gzXlzeWse2z9QR1jA7ZBqVMOydRFxSyqzkQo/RW/qosZc/snulY1d2x
 z95x+qMSZRRAVyOdfAXaSN+jJQ/yLFPrOXcrzeqpo2NPkdrzosgQZEQKMAuUNErAQ8ywshUxmVc
 3ByeaSo41nKU+fa28ULecnxxRREEWlpdgZmfKMN3pQpNAB4a1zUC3cdxjL+OCVmxxSz7vnY3gML
 cFa4bBVGE3S+kcyCBQN0d9BC5/xx2KaWuzZTRqYibl9KUWQYSUPOS6hvBIPsJYKcfZRzu09UvD+
 8kvjGzAdkaSBSe9hIKOOkS4RFhDTjpHajUoY7ctCrLn+ldJEUTLI+ZRhJpHkVmHAWAgUq2mMIIU
 LsHs0o2hXyKKfvt5EDTyzxp47M7MO+sWE68oo02s=
X-Proofpoint-ORIG-GUID: _qW3dN8Q9kJYWi9MDFXP9r4d1GwJ-kxE
X-Proofpoint-GUID: _qW3dN8Q9kJYWi9MDFXP9r4d1GwJ-kxE
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6944981d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WudW6avNSQZdBDIxzUkA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12109

On 12/18/25 17:09, Kris Van Hees wrote:

> The thing is that these discrepancies to what is typical are flagged as part
> of the Debian packaging, and we cannot just tell the Debian people that this
> is just stuff they can ignore.  Likewise, adding in a long list of override
> rules for lintian or a more generic rule bypasses the checks that are meant to
> actually validate that permissions etc are set correctly on files.
>
> So, in the interest of supporting DTrace as a package to be included in Debian,
> yes, this needs to be addressed.

That rationale would be great to include in the commit msg.
