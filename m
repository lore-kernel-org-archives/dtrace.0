Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F03C39
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721433489; cv=fail; b=Fm50yma01gW1UNOf556FbXSyk/5Tr7KHxfNavE1G205Kg443JSVbpHsCTEVI1Kq+h4VHXw3poM5imGQcmfcQf/+QGp+dU2NJHjF0qbQzmPfTYQuTOvzjQ4TVDDqBqfU+ZZkgoNmEulM2NTRNx+ZFgTEqkVh9qdQw4kls0xDTaE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721433489; c=relaxed/simple;
	bh=T7oSe8tE6VZVcjOU0rSFv0bpHAQMdY3iLlM94wKpBFQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W8mB57ait2smPMV/mLWHhI86X031n9qFc9pxyijy9P09VkntsTNCDbHbth61/aZUdrbwW6txakftKb/NZghaM9Gr+bujkb5B6BtRPZ0dmCPcsSiKErkYwxiTBSrvpW5oNbpSHOW+arr4X7E1ndoYg+KJLEiDWdxmE5bfEbdaBeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HoUiJg0s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F4iw4GPG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HoUiJg0s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F4iw4GPG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JNhbsG011134
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=D1mLItY/z221GmQh73MJikcFDvAvpWEMOazEjjd7d8E=; b=
	HoUiJg0sYYfwt/CzqI+M1fEv5vGpz97Az2HsWS23nJa9D0tXSjNM6tFszDo9/Odd
	Ph6Kf64q8JaSqOExn47FAxFyhBbeCG+tCTm890E/Xk0AuqQttC4tbqNP2PRnP0+W
	IE0xFmwS6BTgIV0by/HOgGADw59fiatboodIPMGmVbnxEeHvIfCwRoIpXp0vMJBw
	Q+As52F4Q4g/owAsurz3z1FTO/vTRI5ZyOmFFhJrlnlpsw4oSGAgHLSBaMAaaZcm
	2mutE9T9Nk8ZFYY9yhjMkYyfqt3uPv4zacty4JEMjQZ2UDrRN6cJjkjN6UDtCI5X
	XZuIEKvu3NHuQ8YdljEd0g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40g21300c3-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:58:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JL5ATL004690
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:50:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf2axtk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 23:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJks7LVzqcA9IC6b+dOFC+I3c1NwB3Cn5qgkSFZlMSmlB/51wcuWhozwCnTHTKNMV0dWlIBLD5u0oTDuzISmaLJp/NzGCNTganCJDWG1lDMLY8bRnJQ64ImwQ/dLU/09HdcAkwH5lYHtJpD88lorOhVIUYBrxjbHBIQhk28C1Ijz9vBxiDsUxF3EJDoy1dxtPR7nDch0Pi28s9Lca9Lap6CTITio5Ef2SifSaKeJrYGPQAxJ5kffKaa7yp2JOQneNkTi59hUbA+jHx5zNwUgcHLCns5Ay9KdRNfRSE6/yA5wrHJ7tWyQ/gA5COJtDcV54qhGurMhqlxfLGKR+bXWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1mLItY/z221GmQh73MJikcFDvAvpWEMOazEjjd7d8E=;
 b=Iz63qB/K14XOWACYyDO3+WidHf6qOo9StSIn/xkVTQ7DsKDPozYTo2N7Y/yx6XM/usHTPMSe0ihATxYjDqB5RFh2rkhkGhW31jN8JKT2hxG26jC6NVzInmb2KVX6PEZPXETJGpL+rUARz33V2a9E3wI/aP3ZG4H9UPSRo7lQtX1nvW3irb9+QiZTwAfJi38lXvf4V4vVtKP5+712wXVgYdfwEIC5V7IaFAzcJRl1suA6PCJoyRe16S97CkT+00KsO2KvepA9h3VO8/iKzUUBWMiKW0j6TQIOVkwCQkjCb6BHwrFyAlc84El/bmGDvDdM7+5Rir8xLE+r/RYqdIjG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1mLItY/z221GmQh73MJikcFDvAvpWEMOazEjjd7d8E=;
 b=F4iw4GPGcGVgk/16MIGOpkLKluPJFJ2gGjWub1yHz2Zfk4cirwy9mTnPTddBgkrQ24vyBq6JW5FF2+Bss8WVaIu2Mj6rlGXPWL/UdVWTnvk6A6lWiK8W64ZAa6OVJ1h05qAfkEBLzrwHGMJ6YFsAdyq8xO49B9mzup2JmO1sxfU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB6344.namprd10.prod.outlook.com (2603:10b6:806:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 23:49:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 23:49:58 +0000
Message-ID: <39ae3ddc-769a-baf7-ee4f-6d91629e91c4@oracle.com>
Date: Fri, 19 Jul 2024 19:49:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 29/38] Allow relocation of the ERROR PRID
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-10-eugene.loh@oracle.com> <ZprddULVHQOJhnpT@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZprddULVHQOJhnpT@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:208:32a::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b3526c7-8a40-4ea2-1a84-08dca84d7f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b0tQcHoxNzgrNEV3bWNIUFJUK1dYV3VhZmQ5QkUweHVQRFFVQVBnUmxLWXhD?=
 =?utf-8?B?Q01NSEk0cHJ5VkVXTlk3eCtEU1JPMUQzYUpQSDF5dlZoZzQySkduL0ErYVpF?=
 =?utf-8?B?K2FHbTFjRDVhOWlkRXRsbE9UTVhQZWpWakc0NzdZc3lHRUFxdml2aXlzbWhz?=
 =?utf-8?B?WE45T1JoVFBsL05lS1Y1bm01VDZYNVpqV1RSNjJhelBVeExsSjVMNTQzSkhZ?=
 =?utf-8?B?S0g2OS9zbFYvNUcxVkNzdGpMekMxejV6UVVLejlXMVdYaVQrbXRNc1pwakM0?=
 =?utf-8?B?TEEyOUZ4QTFPcExxeWpzODlsK1pEMGdpai9zcDZ1SG1ZTEl3QWk4TzVzcmgz?=
 =?utf-8?B?bjA3WVBCVG5GK3RZQ01FR0FDcDdSVTlpbzdPbEtQVVo0K0t6MTFEa1JGZThX?=
 =?utf-8?B?NnJmcXp6TElUTVgzTUJaOXJPOStLNzJGSVh0ZE1VSUcwSnN6cm5obFhjWTFv?=
 =?utf-8?B?dkV1N0Q5TWpTU2tOWnZHZmhPdEltejRWWC9qT3NSajhpek1LaVZGMGpISGox?=
 =?utf-8?B?NVpHblg5MFY3ZVhtVnFSUXUvOXF6SWVnWFRCOVd3NEZPQnVLcVNSb0ZXYmFh?=
 =?utf-8?B?bUVuTXZ4L1pIb0pBYzBnekRJWmMvM2l1VmtyT3hhVG1qRVArUmlvUzlWSTQz?=
 =?utf-8?B?TDRIL04vblNwVHhNWG5zVUYxakx3czZabllvY01sSzhLdVlmWWMrSzl1ZTdw?=
 =?utf-8?B?Z2QvbkswdWE4QlRtOEYwcGJKeXJwWk8xLysyMktVeld4VUgvUmZTRkpCTGlM?=
 =?utf-8?B?blNGNks0TnRwZjd0RkpkVWlCUDBFWW5TK1g2V1JNblBOMzhTZStkcW52b1Z5?=
 =?utf-8?B?VkdDa2Z2aHhqeW4rMDE1aUZRTWpiQ3FpNGdLWGNxRDJZVGhDVVdtVXE2M2Zz?=
 =?utf-8?B?bGI2WjNnMVJ3eVl0U3FKS1ptSlFIYi8yRTkzdUh3TWRZUU9WN1NXbXZVVlky?=
 =?utf-8?B?bEtjVUdrT1BhVXZjd1dMeTNHTDVoZEJWU2NTeTdpZk8yR0MrRlk4bUU0WUFq?=
 =?utf-8?B?clVoWk9FS2RCZmJGb0syV2dYcW56V3ZpK0I5U1JXUXJ4Z0FaQUdMaDVOTVBO?=
 =?utf-8?B?Tm1uQVRDSERkQUJFd2lTMnd3eGx0bk10SlFvSUtGQTRTOFh5bUZFVW52UG5i?=
 =?utf-8?B?aHlCYzA3MWZLd3NrZ2NFUHZXNDhUZWg0Sm9GSjlDaXdKdS9UNklhNE9jY214?=
 =?utf-8?B?V3pTNzNYbHFMR2xPbmJvZWYxWkp3R2ZycGp1U1BibVhDaGI4eEtpTUZad3NI?=
 =?utf-8?B?Ni9wdWJPZ3grZjR1cUMyN3AxZHhhS3M1N2pCN2lwUDFTRVVDZWY2cTJRTnA3?=
 =?utf-8?B?UVFYVGJESzA1TVUvMDVDaUtrM0FCRGxZSXJXRmtnbXM0Vm1wNmwwYjEyKzRE?=
 =?utf-8?B?Rm1hem95V0xrNnlneXU1SkZLSjZpSXNCRW9GZmhxT1ZoOCtBeWFvODFDTUhO?=
 =?utf-8?B?NnpXWHZhOHEzM2EzZ05KRE1QNFFRYUZsTnJOMGx2ZHdFcTM3UFBNMGJkYm9B?=
 =?utf-8?B?Rml0a0x4aGNQWTFEVWNzWFhsZkxSNXJUWU1oMEgwWjViYVpkMDFqS2JqT1lz?=
 =?utf-8?B?ZTRJYjlLUTZQeUlnclhXR2t4SGpnL2JTbjBIZFVFMWpKQWpiWm9oSkY5bzZh?=
 =?utf-8?B?WUxEVXNBaWp4dGdRdG9EcWlzOUg3R3Q0cGhYRzBMQXdIcEFiZUticWtYYjJO?=
 =?utf-8?B?TUFlYjIzZ0ljU09XWnQ0ZE9hRlFxYWh6VHY4bGpuR2d3OEVKdG15Nkw2M0NL?=
 =?utf-8?B?d3J0NXF4NUNkSkxLdXVucjZtRUI0OEVXZDlHSnNOeEg1QVlxaTA2VzM3b1Ux?=
 =?utf-8?Q?y5ggJRtDx67GuWfiufMtwsnv0cl8DkHyqLqRk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Zm5lTnRkek56S3hQWGdmRnZnRG5WZ2FoRXIwZG1xdDFDdmgrS1Y5QWtJdjFZ?=
 =?utf-8?B?UW94bVNxbm1XZVJqSS9jSkltbjQrNmlDYmRuaHN0ZGkzdENOWUJ3c1RxUjN1?=
 =?utf-8?B?NnlLNGc2VENkSWt5M2piK2ZMV1pyc1JENkVKeDd6bVVNUGpRdm1nd2VNQjl1?=
 =?utf-8?B?bTdJdW5DcTV4WGdtSWE3MWF2c0lzQytPUnNwRW9aSnZ4NjllYzZPbUxNNExI?=
 =?utf-8?B?K052Y2ZOU3lZR1FsaUpBQjl3U2lPWWlqdTczT0JJbkRmcFFjN1FoOTBJRGhz?=
 =?utf-8?B?Mm44bkhrbFgycXhEVnovbkFYMGlWeWtqUU1KeVNZWDYxMFR1SWswZ1Vza0or?=
 =?utf-8?B?MG96ZEFadXNkZ2QrSGE5TVNtdEpuSldRb1RRaXAzQjdTdVoxWTRhZXAwRDk2?=
 =?utf-8?B?U01tdmNMV1lsc29zdjZmY0t3T0N0NllIbGRIWDdSSnU4b25OUGtMWVBnNEVy?=
 =?utf-8?B?VU9wb0xmUERoNkF0eGtsMHRXeDNyVFZNRE1xTHpHdkZKei8vUmd3Wk1LQk5S?=
 =?utf-8?B?RHk1dWR2NmNGbzY3blE1bXVrQlo0cDd5SGhiMDNrSzhFV25weHhpQUdoaEZ0?=
 =?utf-8?B?ZHQ3ZElFb3o1dEFhRFlKcWkvT29GMUxCVTFZMFRtV05lcWliUWZkTTVDSFR5?=
 =?utf-8?B?bGEwVjFWaVNudEhoWnRyVFh6enRGdGZRTTZKOVpuZUZYd1drQTFZTlgvUk9l?=
 =?utf-8?B?RndobVl3ZUJMZUlldTF5akNtL3JEb056SzVBcWFQb3UwdzMxV3VTVTdRZlls?=
 =?utf-8?B?Y0JUYVFVeDF1ZlhPTEFQMTE1N3pDbmZibHFLTEZYUUtrR3B5VFpjVWorekxW?=
 =?utf-8?B?WlF0NldkMk53bEg2OGVUL3FKa0FIeGY5dTUyR1NBM1cvUzI2ZklUZ3hlYmRH?=
 =?utf-8?B?UUZnVUZFTmJPRmRUVnpPTFJINHRmcDlZMlJVSFQ2YVhzUjU4ejJBUHBkdldk?=
 =?utf-8?B?UDA5RW01Tjk0KzlrUzJTL1NwdTNOcEpyMDZRZGNIaUZEcFBpWG91SXEzVnZ6?=
 =?utf-8?B?VVNXRzhGV2ZKeEErRVkybEZaRlFOM2crMGdvaE5hTkZrWlIrUzExVXdsQ2Rs?=
 =?utf-8?B?dk1iQ0tETDdmUjVNci8wTFhYU0IxVEc3UGJsMktlSVl5Rk9aUzNid29RSU5Z?=
 =?utf-8?B?NlR6R2FFN1FSRXpVdnNVa1ZGN0pOTmliMm9RcE4zUFdqMEpyRHFNdmZCUUgx?=
 =?utf-8?B?UW9PRVFDSVVnZUJNTXdUci9lUVRqejQ1UHljd0twOS9BdEZNRi9vTU9GQUlW?=
 =?utf-8?B?eGVWbEJxRFJqSlFUMC94U3llK1FnZTJnWXBWR096RmhPOFRIZ3NJU0VNRm1I?=
 =?utf-8?B?M3lQa2RJSVkveGlTRE5QZnBzdHFGUDV0ZXlSbG5CcnZDWGZpV3pQbmYvTWpi?=
 =?utf-8?B?ekdIT1ZNcjNWWDVIMmlTZmV3eXNrL0tROUxZYStidXVxL3o1bnZZM2huK3NH?=
 =?utf-8?B?MkNEYVg3VHp4bC95K05CYVFPWm5IWnRMbHFPeW9MWFc0akdhOThSd2RLdXFv?=
 =?utf-8?B?ZjZwYVVXeXJzbW4xYTR0cVp2U2Z0WjB4T2t4Q1FSTmJaZHlwTVpYcmZydFFS?=
 =?utf-8?B?MkVkWXhTUlAxdy8yNzRKTWhEQWh1YmdFNlhZWVFxYURvQWYrUEE2dVBRQmdW?=
 =?utf-8?B?ekhTbDFjdDhYdWRyTVNsbCt2WkJTVjNya1RJalUyK0hEQVo0aUVEcWhPUUVw?=
 =?utf-8?B?d2FsdmR6bkwxQk1MNVNKbVNETXN1Mi9RekZScmpKcmMyQmNjem1kR0JoRDNT?=
 =?utf-8?B?TW9PbkM3d01FTWE2UGV0Q2FiS3F5RERGZXBCMERmay9oVXdidHFQcjdMem1X?=
 =?utf-8?B?OVpabHlEZmV3YTJ6WXBobXpyd25TQ1QwQ2hwZEdUU0lTbVpiOW4xYXlnTTUv?=
 =?utf-8?B?MTNnOXZNVGsxMTErUmJIeE5RUzFsVi91M1QzSGhTYlg5MEtrdElGcVU1RWRU?=
 =?utf-8?B?UW9HcFJSdVQzZXp3Nk80aHI1bEo2aEt4bXhVWGVsVWgrUG52TUdab0RNQ2Vn?=
 =?utf-8?B?b0RHRGwrNkdoRWNCc25kdkJPdU5YQWJSaEltYTI5VUFoWlQ3Y0xYQ3ZSNmFW?=
 =?utf-8?B?T05DZ2Z3OGo0NXg1ampsbDAzVHN3SG4xNndHS1ZKcGxmSUZaVFNNbnRraStv?=
 =?utf-8?Q?7xrZ5HNSV5i+SNopwsp9qQq6D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	JtzVzGlVTIV0WpHv9YottJLZrt3NX2I+NPp1mAPyWFYcwusFJOx8Au311eqHNYhGM+yO3MoQ5NNh6D4v7pLnTJjLyxKWt+oGS3nGMiCvu7gz/T7hR71a08rA5Q5l5fiae3dzNDaIP6bog66oP8bYnV/BjPN/k2IwmvndrZWNhx3BzfoTgi+0Q/xesRfvcoN7IfK33Z4X86SigUjNZ2AFwJ3C3spF2hrTLGMBEJe+N95Iz5W68eQR/oVksEg1LTomuKVmbVeBK53vCTAvwMKhiBkrjCYxmzTEIWTX8WRNlBkw49/3MGMVHxOJLqSOEFIjQzhF6g98V0D4zPgNx+QyBEca5Glv1Fvv00dRjuKvpngj8CKHUy3ebuM++CVEkfIImHIfpiTxXnFPFxqAxi2QMQ8cS4l7TnptYSsnVmQU/TNSVNXKjM9QXfFdqVZte1UmwGVISAyR0Ex/fEEY+sNHJ50rN5LF6m9XB1SSl/Gs4ewOTI1Rx1ql/cOj4DImIhDyPDBs0fjp4DjFtQDhfeti1Bmal24xpQwYlz01E2VdcoIV8OUjBC1yStlIC/T6+MZB4m2VDbCPm4du077fBfeqEFV01ebFhen99PEyhlHYrHw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3526c7-8a40-4ea2-1a84-08dca84d7f20
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 23:49:57.9820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXiq5lFbv1e2GPznuyA0zFlymFJTcLfW5Ntij7HUijgjEZl1JmZtlK6xSDI04aBCvhwXHXJ7yk76kiLd/Io8Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6344
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_09,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190176
X-Proofpoint-GUID: HC5oC8SehlqI1ia0DlE-_XocrjW7OFFs
X-Proofpoint-ORIG-GUID: HC5oC8SehlqI1ia0DlE-_XocrjW7OFFs

Yeah.  This patch was superseded by a v2 (Jun 27), which acknowledges 
your point.  It's "simpler" to say "3".  It is arguably more robust to 
set the value during relocation.  I figured I'd do it the "more robust" 
way and am happy to be talked into the simpler patch.

I'll wait for your comments on the v2 patch.  If there you say the extra 
effort is not worth it, I'll post a v3 with the simpler version.

On 7/19/24 17:41, Kris Van Hees wrote:
> Why is this patch needed?  As far as I can see, BEGIN, END, and ERROR are
> always created as the first 3 probes (in that order), so they will have probe
> IDs 1, 2, and 3.
>
> On Thu, Jun 27, 2024 at 01:38:55AM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_bpf.h   | 1 +
>>   libdtrace/dt_cc.c    | 3 +++
>>   libdtrace/dt_dlibs.c | 1 +
>>   3 files changed, 5 insertions(+)
>>
>> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
>> index 5b2df264..58cf29cc 100644
>> --- a/libdtrace/dt_bpf.h
>> +++ b/libdtrace/dt_bpf.h
>> @@ -56,6 +56,7 @@ extern "C" {
>>   #define DT_CONST_ZERO_OFF		22
>>   #define DT_CONST_STACK_OFF		23
>>   #define DT_CONST_STACK_SKIP		24
>> +#define DT_CONST_ERROR_PRID		25
>>   
>>   #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>>   #define DT_BPF_LOG_SIZE_SMALL	4096
>> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
>> index d1ee3843..3d9a9c79 100644
>> --- a/libdtrace/dt_cc.c
>> +++ b/libdtrace/dt_cc.c
>> @@ -1076,6 +1076,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>>   				nrp->dofr_data = sizeof(uint64_t)
>>   				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
>>   				continue;
>> +			case DT_CONST_ERROR_PRID:
>> +				nrp->dofr_data = dtp->dt_error->desc->id;
>> +				continue;
>>   			case DT_CONST_BOOTTM:
>>   				if (boottime == 0 && get_boottime())
>>   					return -1;
>> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
>> index bc883e11..1fb561ad 100644
>> --- a/libdtrace/dt_dlibs.c
>> +++ b/libdtrace/dt_dlibs.c
>> @@ -80,6 +80,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>>   	DT_BPF_SYMBOL_ID(STBSZ, DT_IDENT_SCALAR, DT_CONST_STBSZ),
>>   	DT_BPF_SYMBOL_ID(STRSZ, DT_IDENT_SCALAR, DT_CONST_STRSZ),
>>   	DT_BPF_SYMBOL_ID(STKSIZ, DT_IDENT_SCALAR, DT_CONST_STKSIZ),
>> +	DT_BPF_SYMBOL_ID(ERROR_PRID, DT_IDENT_SCALAR, DT_CONST_ERROR_PRID),
>>   	DT_BPF_SYMBOL_ID(BOOTTM, DT_IDENT_SCALAR, DT_CONST_BOOTTM),
>>   	DT_BPF_SYMBOL_ID(NSPEC, DT_IDENT_SCALAR, DT_CONST_NSPEC),
>>   	DT_BPF_SYMBOL_ID(NCPUS, DT_IDENT_SCALAR, DT_CONST_NCPUS),
>> -- 
>> 2.18.4
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
