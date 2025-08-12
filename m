Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0F2F0661
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755038777; cv=fail; b=KyRueurFwC6n3XaOj5wcD+WAEtwx+5JQAgnnizE5V3UBldk7di0yLggexES+Nbjpy6zOjzY9h2UHRbuUS3DcWLYprSAIdTV678vBhrP8JircXlwhtpowvGwXOkytpSzIk8kUbN4wY1TNUpqZ21sJjnsqRB+X24VnFi8AutzrY7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755038777; c=relaxed/simple;
	bh=1jaHBJXpdGGPFJNM4Kknrsy8eDfq8XIHiaIeg+Lb9jk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=C4EasiKyd6nc5CNDVIf+CjwTZzaTvnCnObRa5tIExTJ8l0pBQGdWxggppmUq7tKhKl+harHg5oqMh+raEEnyaV9DSuUF8oDq57EeRwDlYX48XOrD+AGjZAJdTD4RgDzakYMJv940gTj5/Gcc6zWpvSjgT0RIDZ33pkJlFTLCQfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FqKSxTOU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uv7ysocv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FqKSxTOU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uv7ysocv"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLQsxL010635
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=/2HqcABldcmitEyt
	yzDRvWGWJ2eQhw4pelJWR76DCHA=; b=FqKSxTOULAoZ6jYahgiUcBG0p3K+jnu0
	L8svJPQfgZK+wBhwHBP/UeSvPWpB71U17m3UuMo1C1rmvfLP+XC3EZiyX9yjipbp
	l6I3Dae99JardHDDC47YubZ6gBC7TUhFTx0LO1Ye7iQFxynNqKS0/c0uEYUkDcfJ
	AfTWDh9tpPFQep//EvkNt58DdKV51ia+qVvkxYmbCpDzlMfOltES9Hq7Bqxm6EMn
	NBsEzJiYwNekK6j/A8rYkBFpaGJhI81z7iIFvFUOLP8sQeo4mJp/smeABSghLGX0
	zi3zzH09CPi1FLtpvra/qGEigMQ0S4fj2OAw2LC+Otay5EmEcqMh/w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dx7dnua9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLgr2U030333
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:12 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsak66b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDYgz9n/Tyjr6ubvy31jWL0XBagiwe/YIDqfC1nAWCRkTRHBP84FYk26gXLEFCgMyeJs1MF9ipnPB/+AlKby7SC7XKbNckoZfKskBEYVak7AwqJD/UJb8shm15wI3yb9HpvxFGb7WcUjmj2Xb/jLtN17UiG0NqyFqSwg0IFVH4YV/nEfdYnRMnUQfi92ulzGfS2LaaRdAhBzxUh1KS71b7w6nUltHfgrwh+MJzrYd46s6K8URUf6NCG9Imyj8xyJLyX/8rHEGKQILUQHTuAeFjQ1DnJSf3TQYFj/6TNskJ0FI7oTLLqP2O6v0xo17EsvDkcxn6uV3T2rQPp2AlrfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2HqcABldcmitEytyzDRvWGWJ2eQhw4pelJWR76DCHA=;
 b=cyXhpquAfNOQ1kRZSsnu/7Szfy9dtVJWGoriErga6CTwGlu6dEQeyMoYbvH4DzChYvOdwikqtjpduy44RTD8XzCBJR0yblBiPyTQ2z2yMOEVDUvGeYXMVZl/dNab0krV+eOv7wePurS1UFfmSk4KRw3UAUOcMd1LOjboQ39cNzN4oRPDlvAODLkM15AoUQ9VTHvgNEjd20xGqh6k9Pe1+uGcHAXCrLfYcK/7o4ShoqTd0iFYUczEg55h/kMaLtFgDhvEg2sYnVoXs7SZUc44YsFvTne5AHtU8LD9RoM1FkprpMmB5DapgDGtzikWg29fcnrHTv8GtjSi+ctND4g2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2HqcABldcmitEytyzDRvWGWJ2eQhw4pelJWR76DCHA=;
 b=uv7ysocvxzyC+VHyiHBvbRFr1wEQ8BXLAV9sK/COPc8ETC6efwlCZcitLvY//ElePCP+Immft7+AwDmXSjjr1Ixxvq8Y/LptOkyViIEUev0w5wR16vpPwKO14ifVDWLDA80dr417KCuwNVP3rWQxYTkpKwcs0cVW1eIjLf2AWWA=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH7PR10MB5854.namprd10.prod.outlook.com (2603:10b6:510:127::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 22:46:10 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 22:46:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Possible uninitialized 'last' variable in usdt_copyin_data()
Date: Tue, 12 Aug 2025 18:46:05 -0400
Message-Id: <20250812224606.16606-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0452.namprd03.prod.outlook.com
 (2603:10b6:408:139::7) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH7PR10MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: f32c2305-14d5-4158-4fa4-08ddd9f207f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjlTLzBmQnhpckhrb0RlQ0k2ekNCdDEyVFBaOVUzZFpGc1YrODM5bjk5ajcr?=
 =?utf-8?B?TUdzR2R5VC9vR3VSdUx4a0E1cXhGNzMrVDJ0QWtsUlJ1a0VGaUJ6N3BrUmo1?=
 =?utf-8?B?Nmczd0NhMFFtYlllMFViYTYzaEZReU13RlkvdlpOVmpOaDVkRS9CTzNlS3JV?=
 =?utf-8?B?MWk4TVhjV2tsUEpUMm56QnUwUHFwQnl3YWJ2dVhLcXN4UllwTjFJN2N1VnRh?=
 =?utf-8?B?WnRWbXNrclRzUlByOW9zVjdUREpYTEttNHJvak5raDYvdWtXeHQvVWkySmhF?=
 =?utf-8?B?ZzlVSE5YTmsveFN0dDRYdHlqTmVvcDhzUlJwWUFtb215WHc4dDRmdzJvRitk?=
 =?utf-8?B?a3ZLM3REeUNUelNGcjZQT056UzNaakwzV0VHOStlUzBmNWx5TmQ4RjBPRHJJ?=
 =?utf-8?B?c1JOL1BPN0JiZ3pzdXN6MUk3VkVZTVZBL01HSURUakNPMGtvYVd5WGRva1o5?=
 =?utf-8?B?UDhMSVlqbnpWalRWTUtrYXJiYXkvSG5kV012MWh5VTVkQkl6NVZRaFZHeTA5?=
 =?utf-8?B?Njg3eXlRZGwzRjZzakJFTUVFNE5uNUd0TC91TmREOVpCbnFXOTVoV2ZScENj?=
 =?utf-8?B?OWpGYVc0NmVNcHhGamc1RklpbUcxRHlhQXh0OTlqbEJqR0RFdkFaWnlJQVVZ?=
 =?utf-8?B?ZnRXZ2xXaDJwTEtiYllJaG5hdjZ6eHRCVTRFS3I5NEdCT0ZTdW5kZUk0SUQy?=
 =?utf-8?B?eS9QZGplQjhBbDdhWEczZFlkeGpJTkF5N01Fa2I5L3NsZ21XRnRLZFE2MXpC?=
 =?utf-8?B?dkNselVhc1JwTTJ3K05XcTBQVUFEc3dEL1FjRndwSnRnRm1CSkY4aXZCRUJm?=
 =?utf-8?B?UmVwWEM2ZmFBdnFWSXdLMlBLU0NBWml2Mm5NYStRUE4vc2ovTmhrd3JMS1Ar?=
 =?utf-8?B?T3ZmVzRzTVRzLzRxSXBVOU5IdlRDRlhTdXFTdkM2QjRZZFhhWjQ1Vy8yNlRp?=
 =?utf-8?B?Z2NiTnZUa1pwTG9OYkNMZ0xsN2FrVmE2N1dWSW1sWklsbzBMa3lPVzZtYzc4?=
 =?utf-8?B?M1hkeFBvNW9tL0xBZ1JxREZ0K2svb1FhQXBCYlRGM3pOcEtkTGtxdEc5Vmdo?=
 =?utf-8?B?bzBUNEdLSkY1VHRQR0kxNEJQQmttTlk4Rjc2Q2pnWGV3V011R01TYTRUcUNG?=
 =?utf-8?B?TDR4VXdENzJlcU1wSk1YR0drYXhKR2UvdWpUZDdYa2RvSGhGQ29TT1paRERK?=
 =?utf-8?B?a3U3dmpGWTkzTHdNd1krYTlhSXloRUNFdFdXWEVKb2VOcFJHMmFNS0E5bHdI?=
 =?utf-8?B?SEJXTWhBd1IvTHVYaFZveXU3MnN4WVk5L1p4Ky9vdTk0b082SWRLb2lyNFlL?=
 =?utf-8?B?cTNwSE51cmVWdll5MVlROTZlRUE1MTkxRGZPNU1XSHh3YnAxUm9GeVhCZ2Yz?=
 =?utf-8?B?eGk3eWRNVDRTV2t2dUVialMzV250Y1BMR0VweXdTUVdacllZTnpiTDFDSE4y?=
 =?utf-8?B?ZnN3T1pXbWV5allpSC90RzFuUTJpKzQrSXN2Y3F2ZVdxOSsrUjBDc1YrdHNF?=
 =?utf-8?B?WjhBdWFpaWRNWWdGNnREcGI0K1BmRWt1WFpUb0h0dGtVTXVRZVA2T2NVOTE5?=
 =?utf-8?B?TmhWZmhBTnp0RXk5K21oMnlEaFFucDg0SENHZTZ1bWtIdmxXSGhOWDlVS0Q4?=
 =?utf-8?B?TWpSamJNVDc4ZlUwYUJNelVRbW5ITlB3NEZhZUE3NkxhbTQ3WU9SQmZXak8w?=
 =?utf-8?B?UmRhcnFUSFlLWmp5STFybXptRmxxdExKZWZXME03ZDdWR3Z0TVpkckRSWXFj?=
 =?utf-8?B?TncyVFRLejI0dUcxdkVzanhobFdEcTFtWXJ3VnR1SXk4d2tmRUd1ekJKRGw4?=
 =?utf-8?B?c21JVjl4LzBKUVZKRXdDY0QwM05hb3ZWTFBIRkxsdjdsa1dVNDBZaDJsb29n?=
 =?utf-8?B?U0dQWFNZbXVPYUJ6STVGTUdab3FkZzlLNW5IT1RZUHhUZ1I0bU42UVZZTUdh?=
 =?utf-8?Q?CIcpi1AJFCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlEK2laMkt3eUpneTF4WHlsWEI4YUF6Wk41ZmYyNm5rTE9lWEZ5bzVnaHpT?=
 =?utf-8?B?L05SQXg4R3pnSWNuWWhRRFZrRUZBSUlLRUpNbzNxRlJvNEo0dmZ1Nk5mN3VK?=
 =?utf-8?B?RmQ1a3RUVHJjS3ZKRFh6Q0tIZENJZTd1QnEvWDdWV2ZhQjRmcnVKMDh1TDVW?=
 =?utf-8?B?VVU4cWI5Z0FZMlp3clRUaXhTM0NYNDUxemxLZXRmZWdPcmF3ejlrMC93dC9k?=
 =?utf-8?B?b2pyZ0FuM1NoK0ZaVnh4aWlkQnpRNEVQWTROUVhzUkhPZ3BCcVNOTFYwaUhL?=
 =?utf-8?B?Y2t4MkFodEh4WWpRL2VWeFU2aHZxVTlTTFdGZWtiTzdsTVI5d3VoK1U0NXcr?=
 =?utf-8?B?bHlxOGs1alB4VG8vVlN5clA3b2NEZXZLVmo2dUJLR0cvSHgwRFFWbWpERHRK?=
 =?utf-8?B?Mk56Q1BtS1MvdGVMNkdMemNvbUh1VU9Qcjd5alNCUDI3UWNWZXRSYjVVOXIy?=
 =?utf-8?B?TGNSRFhLZW9sQnhMKzJIZ2hJNGRFcjQ4Y0tHdTZXeE4wN016T3BPR0Q2WFlH?=
 =?utf-8?B?dDVCbjdPcGwrb0k2di8rUGdSdVoyeURKdndhVFFBa3lYcWh3TlcrMk0wVDdh?=
 =?utf-8?B?VjlYcmRpT0IwWk1ZaGd6MCt3NGJPRnFXRTE2dTlRYkRuRlhudUZJNE1xSlZa?=
 =?utf-8?B?dEtQN1ViS2ZyZG90ajQ0WE9QdWJjMUlCaitxMHBodzVMZnZzVElGTU1oYmNU?=
 =?utf-8?B?K3dHbmRndHpCZTVSZGl6MWJSRmloWU1WbkxCdm9mcnVZM3ZuV25odjRBeVJ5?=
 =?utf-8?B?RjYyY1dUY1U5L25wWlRzRkN0QUt1RHhBTThSeFpBMG1BcTVzYUF5RjBOZXdU?=
 =?utf-8?B?eUpGVnNWNjJUbTd6SkJHbFY4dXA5ekVpd1NpRW5OZUdtQnNMU2l5NVRhZHR0?=
 =?utf-8?B?VDczbGxFbjhUenJmKy9lQjJ5QkJLbnFQN21WeENMSTkyV0Nwc0FlM0hsMUd3?=
 =?utf-8?B?dUk1RWxmRmxYSHJqaVIwQTRjUlJDbWJOZHpmQnd5UHdMYjAvelNVUkkrdkdv?=
 =?utf-8?B?Tm9qaU0zNHVSNjM1MXVOTGtlUTVMZ2g5RUIwZjFhbWVqMTNyZ0ZlSENxcDBP?=
 =?utf-8?B?Smx0Y0laM2RIbElGMHF4eDU4dFl2d2dKUXRwWGd4UE9aT0htK1UrY01sVFND?=
 =?utf-8?B?UXF4dlVCTnRaM0toK3d6RUR2dmJsQWNwd3FnbkIzbTZNZlZSdkoydk1nWHFL?=
 =?utf-8?B?ZnEveWFSZWt2bWFweWhNeHRVK0V1aWZyVFpmbTM1Sm1DVjRKUldnUHZ5b3Ns?=
 =?utf-8?B?NVE2UnMwWHNGR1hoNjg1NHpvVW1JRlAvaGxheEFKL3N6TDJpMnkwalZ0dGU4?=
 =?utf-8?B?eDNFdnpJWmkzbG50OG9jbk9GMTI3UU9ndnloOGRYTGNyeUM0YlJFWnFzNGdt?=
 =?utf-8?B?MFVuZEtwUmJDK3Y5Z2ZXODE0MmNlSnkrMXNHQlBIQWZvVzVqUWJxQnVrL0JD?=
 =?utf-8?B?eUJIamVxNWJMV0pjSmliTWs2OWVlMldoeURmQ1NkLzdjdnNwcjV0eHpvTksr?=
 =?utf-8?B?VjRySGh5RmVPdit0YmNtaGRLUWI0enppeGlPZVFOREtKYU9hQWtocGpYTHoy?=
 =?utf-8?B?YllkbVZaVHp0UjB0T2pTdDBGeXJrK3lWT1BGVUQrTjFNYU5RcWNZYlNJVXZT?=
 =?utf-8?B?TlJ4RHpVL1dMZWJxaHFTYXkyTzJMaFJrZ2orakRJN09YZzRHQmh1MjJDSVM5?=
 =?utf-8?B?TjRML3JwcTdoKzl5UE5vUHlaNmEzdFpGZzZ3d1FSSkdrYjVsbU1UbW83ZmZS?=
 =?utf-8?B?TVZYbC9IaXc1aUFETTRlZ2ZqVkFYVFVvT0dVZzVyNGt1d2FLdmpsTXVaMUtO?=
 =?utf-8?B?QUdOWTRJSE1nS0VUaXU4MFVDNVlrNSsxb2NqRkwzS1ZRQXdVUU05bEFoYWRp?=
 =?utf-8?B?NVhTTHhaY3hpOFhxdGRvZmlncDF0R2c2WityREVwWHB1b1hHcy9iMXVsQjQ1?=
 =?utf-8?B?TWdicEh2R1B2OGVHbVJtZXJ0NXZUSVRVZ1VCTmFxbCtWYlR4SlpkRXVabHEr?=
 =?utf-8?B?dk0waGhNRzNqVVNiZStBVm1qOG9RRzZXT2kxcUIrc2xzMmVYNFR1cE1JWjFK?=
 =?utf-8?B?Q2ZSamtkb3Y3am9uWXNjYktpTy9LR3RxdDJhdjQya2tXdEJPRUVubFEyWElT?=
 =?utf-8?Q?mtdwURp09uNEv478zUGqs5xV4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sn1rwVaMqX7LaDA7rUq3UTMJcMBkmDn4h5+iwTxloIzXNWOi0WRpvhyjMVIzdLevXyUI/V+AfbOytR0nfva5T4Jcpw6b6DDCf9RZWxsAT1c/Aav1Ai3vrH7D1I63q5+hFNYbdTogknQvUJ1TtAu4FlAbln/Hl3MYXjRkSWkxXRnsem9GGSGykbZhHGDFyVQv4vWtw6CXbGUM/KagrnxKuPc5l8Y78UOQDQnVIRCka84aZTKi2Y8SKpVw+PKBUIA8mHaTH0HfUQUi8Is4cQBGaH4kQ7IC5IQfmHnUfWHFZcXbfQIfFQZEU8wjNxYzlxKwNhrbAXmvYgtdTKwp1ifKRKw+Hd/UO9pBGCCmkvp+mZ8MHKsD0o3LNaOzgNJIWssKyi1Z6Es+h+by7EKCHAk0Y3A76PNf4T8Muuc/eBE5H2gtaYUVYkAuVgsiUvpocp5L8514fcajOevl0IioE/tZMaYPMLPyW/IpX+2Xhk1HDSEbnUlDqrA94GJ5gzUttjWuUn63vQ6nEhkt3Wkg+4SnB6WGiXpaQqZ/aEBuvD7Ee9zQxvgZfzolSmY0wI77exbhCxCmVXGoYWjevwuwjB9RyxfimLlCbFGrzM4w3zedrfA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32c2305-14d5-4158-4fa4-08ddd9f207f7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 22:46:09.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1Zf4/Jy/I6w4BEsUOIXhezsjfkY7ITNDJ22k4dTxeKflh0Tg3LQQTKmUc+EGC+V1ykJbCoCLS2D1f4wZAVwFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5854
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120218
X-Proofpoint-ORIG-GUID: Cpbr0_uc75-whjjpCFZ36EAp4NPG9w0M
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=689bc435 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HtUOmziM2DIHkcWw4q0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Cpbr0_uc75-whjjpCFZ36EAp4NPG9w0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX0MF1RICZ6Bh9
 2m+Rvd+SvLhRaIJydGN3xYoKeFqWfWaY72P+L3WtC2J3cgWEY34/VVjZCaC8zBqsfhIw+K0PAW0
 8qhmDDYe897Kit3o8hPFZoz7Y3KY2qCLrpbb71qQryy1/qAWNqHBcqeQI7vNnpZvVsZmSJ+s0cf
 7d0kpPBYBLAjDCzvOMIh7r9BxDdgpH087os7O7uhJNHpExn346CbS8X2nvObMpUr5xu8n5hlPoQ
 0yAulSVTQj7meOD4/a/XrvDpLKfQK5LRfc7j4V/xV05jouMd7nQBjS3MXOjP/TKQNcu2Re6ozzN
 NFrC9wPJhV4/VI8xGexhKSUesWnu74VhxV1r/Gl2EuJyXjqymXZfmZZfxJv0NWKfZqtVF9q9urY
 IbW5qGB1XIJ5S4ZhJNn5xiWdd7K8/Fol1g8SBQqH6gRn+Itzd31x8uGtFi+97d+ikfxwtX4k

From: Eugene Loh <eugene.loh@oracle.com>

Some compilers warn:

libcommon/usdt_parser.c: In function ‘usdt_copyin_data’:
libcommon/usdt_parser.c:191:15: warning:
   ‘last’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    last->next = blk;
    ~~~~~~~~~~~^~~~~

Change the "if" check to make it easier for compilers to recognize
that "last" will be initialized (and non-NULL even!).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libcommon/usdt_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index 864198098..d8cb9b7ba 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -163,7 +163,7 @@ usdt_destroy_data(usdt_data_t *data)
 usdt_data_t *
 usdt_copyin_data(int in, int out, int *ok)
 {
-	usdt_data_t *first = NULL, *last;
+	usdt_data_t *first = NULL, *last = NULL;
 	size_t cnt;
 
 	*ok = 1;
@@ -185,7 +185,7 @@ usdt_copyin_data(int in, int out, int *ok)
 		if ((blk = usdt_copyin_block(in, out, ok)) == NULL)
 			goto err;
 
-		if (first == NULL)
+		if (last == NULL)
 			first = last = blk;
 		else {
 			last->next = blk;
-- 
2.47.3

