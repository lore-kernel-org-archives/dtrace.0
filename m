Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE01CF5E9
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728687386; cv=fail; b=AmL272L3EQABN4xr+mz+dnx5PGi0e9j42e6ge9JFnA9xlueFcH5mr48lJCYfgt1lnWs/A5gy/fILmwCK4+X50wkfkBZOAYijj3L+pXpGFXMSmXJQmoHCIm12ymJTnBIDM56pJb2l7K0y6FFKSZC9n/uYsoW2tkjGBRu/kO9n024=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728687386; c=relaxed/simple;
	bh=tychrUZgLXAj+x018XlbaRtRFEn2IQ8DtH0DDI4w4JA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IsaaArmYaFwGx+z19NoV3K2kT4pDD5lXDFG4W6czQ8PuvTCvjejkzXOiOerXJXtdNcNdZEMouHBQC/OxjxsqFra8P7RIK244IV2Snf+s/y3nQmHIj52TakX22O8vR/HMHRqlGS3L0qnWzCwLvJjj3WwMbHCqEAZ/kAjOy4VKjh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iZbTID6J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AXrKhswc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iZbTID6J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AXrKhswc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BJPaxd007054
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 22:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1g/fNQwiVdo8+G/gkpsZCyFy6QGzV4V66T37yneIpfY=; b=
	iZbTID6JbwHo5HrnRNjZlo7y87RNMypckUXCuESLIOAmgUtyduNXGQZlTnT+oInU
	JMSIDfP2sVwLjEcVGBcm9/jT1/nhGulpFTQoK8keVk2DvaEcHhPWKQhDqPPeafVc
	Q8uXFvYfLtRfsm4YAv9K07yv/67K+uDMyzC/d4Ej3zw4jtuhm/sMJLIGlXvSq3Ds
	l8wYtG1j9yjVLmTnRfJBzlid5J+fhBDfbiBCEYp8HmLPV4OQlXNS9KMBATnQzGzT
	B6xlOHIFUA2a/dsW7/JXL1uIft0/jMyrw6d3s0pT/3fqkWjbo8B9WHEgolMUuhWf
	UYzZ3DArp1A2OmRoECEvNQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42303ynx3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 22:56:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49BK5FX6005757
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 22:56:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uwbtxhm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 22:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOYS8mc1KbpL874WMw6jodxsvwqQv5tZ3yjYlp+fi0kw+mx/La4QZGpOWcEm2RScWv/nmWNhrd1tWEcQRqhAiddwoNIJC7DSd4s0x0T/VMMupRZgi/U+7k4WyxoK+zDWprjJ/BTWis03DH31VXJNlAt7zriECC9D+EqnqK6y9FKa1NvvjYdabl9g1BiSzNM3gFCl5kqVE6WT+Ch8jI4PyY9ySE55+c4ck28v8XFvETEHNZc1kXGvVeV38C4cH5NtkEorgsHevsNt+a+aSeFdMbRF9Vr/BEM2dQMEkigDrexQtzXcjzBfECdf/nPo50Rhh6JZ7l/SdzddZXRUCiFPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g/fNQwiVdo8+G/gkpsZCyFy6QGzV4V66T37yneIpfY=;
 b=RJpGv5eERMfJsPCA8kPvuRWaTYgrnyzu+aGuszXSJQ/XSW+kHE0R8o8h9LnLrAATLnigawqaDFOTUArrNZmbqgWUlhVFk2gAb27YRk7wUwQgStXtu6CCPZCWzZCG+hCa3Tnx6v9M5KHXaYMpfGqTxHmJUDVVjHfskaA/O5IIyrBvZKDllECFujxFoCNKyz2xdapdWfaj9CdO1lFLQjndWZeVYtRuSoBS6+dsqaQNGhbbuFVOpVzfTZyjWbcma7/Z7od5S4cprEXS8tjtyXv/923uUWzXehKuJg+2Z8Sgfshhdb/0UwMcNmrthhL+ZO/JvMng/tfnxEIUBUMztB6lQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g/fNQwiVdo8+G/gkpsZCyFy6QGzV4V66T37yneIpfY=;
 b=AXrKhswcmiFZ44eeIMt2qY+WysgPE0d/4nErTR4e8QG9mBqvPHMB2g6hTWgzbCD7idHXQ3rE6MZFSJ30QIdq1JEnASiWzh2kLtm1z3H3LDPq5GzqxTmKwKGQ6NQCNQfRzdQ78xrsXyp8/elG44g41NE2XKn3pr94MJtmCqG/hVQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB6021.namprd10.prod.outlook.com (2603:10b6:930:3f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 22:56:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 22:56:18 +0000
Message-ID: <44ae36fb-9065-d761-5571-d1d2657e5ce0@oracle.com>
Date: Fri, 11 Oct 2024 18:56:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 07/19] Create the BPF usdt_names and usdt_prids maps
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241009054535.28199-1-eugene.loh@oracle.com>
 <ZwdeK90de5dmBFT4@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZwdeK90de5dmBFT4@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB6021:EE_
X-MS-Office365-Filtering-Correlation-Id: fb980c6b-1670-4869-85d4-08dcea47ea93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzZTSURXaDV1S0RJQjN6T3JLTVQ0eUtxZzdHOFhBUkM2Z3crTjdSbFhjTEhl?=
 =?utf-8?B?SHJEL2thcWk2bVUxMzVMbHl2eGRmcWRPRUxDWTIzdmw2cmNtTGp1MTJaWHps?=
 =?utf-8?B?aE1mZzMxZ1RtcmJvYkJjbFRFRCtEUENMQ2pvRHVGODdlMTdPWWowbm8yaEdI?=
 =?utf-8?B?RjNab2ErSWxKL284TExnaCtvblAzTm9Xb0hiZFBlNS95elNOUitxd0VpVFhR?=
 =?utf-8?B?UGYvZkRiMFNkU3hoV09EZVZHSERZeTlPdVhPbWNkQWt0UFU3RkNqVUFtVUVY?=
 =?utf-8?B?ZXN2SW9VK21rUDUvNVRvSmNKczJkeXVMbVc5TWdhQld1b2FVaVZkUkJtYWZI?=
 =?utf-8?B?RVR1NXlFc3hMWUY2V3NUbWc5dC92NCs1SkFCMkpXeFhDTzVvNWlkVE5CT1hJ?=
 =?utf-8?B?WWVBdUVxME1LUC9MY3l4aUFFVXQzUUlhdkxvc2RXQ1REb1BzdU5SQUF1bnlS?=
 =?utf-8?B?NFVxbEhaRHNRYm95SjZybkJjbmhRZ1NyWmlMQ0M0UWF4Vkg1Q3lya2RpbnVh?=
 =?utf-8?B?cW5hMDU5RkljZW9pRWNpdlF1Y1padlZOYnFDSDc2ZDlhR3B5bC9IN0Z5VGpQ?=
 =?utf-8?B?SmhxbTEzVEU5YUV1aUEwOS81VENOSFhLNmNwWHd4cS90OWxvcDRNb2x1RTJp?=
 =?utf-8?B?RXF6MlF2VVkyZnFPRDBPL2ZyVWJmTXUzMmJoV3FLZ0gwOGIyQnYxOGtDN0tU?=
 =?utf-8?B?ckxpcnEydzhTVnljcTZFTDMxUDhEVUFQTnZSTmxzV1lKZjM1c2tIaHhocHdH?=
 =?utf-8?B?UitVbUJXU3ZHSXh6VytrMEduZVhXZm9Hc01jQXhUTVRpTXhuTE1LLzl6RWdF?=
 =?utf-8?B?bVFWSExQZ2drOTZybHQ1Lzd0TFJ5ell5NDBXbmViWUZWMEFUdStxR1ZwS29I?=
 =?utf-8?B?QXZaMDdhbnFneDhuRTdsV0tXTW1iTzZhVHpjbkhFRDh6OUZnc0xlVEh6ZmZs?=
 =?utf-8?B?M1B5ckE0R1dtdXd0dVRLM0lYZGphUXNuaW1wN2svQmh0dTV4OGJhRTRLRkxT?=
 =?utf-8?B?bmNJMEhsb1RrRHptVmlUOEQrVU5SQXp0M2I3YVpQOWVrbGV3QkduMHNMY2tx?=
 =?utf-8?B?ZjF2dmFLRmdrVXB5ancveGxzMzBwM0k3VGFBSGpESXhSVCtSdVhKcnMrRnJT?=
 =?utf-8?B?bEhWMmRqM1dZdGhENlQwTDRyZWxUOTJ1L1FXUzNUNDFkZERHN25GWXJlek44?=
 =?utf-8?B?WXRpTzJIemZ2R2ljSGFtNStuZUZyY1kxSDVlM2xhUWZHS3dQcEM0OVFTYzdl?=
 =?utf-8?B?TXo5ZHUzVTA0b2szUm1GbUJsdms5TnZEYnozV1ZVS2szOUFYR1dFQ3ZNcy9I?=
 =?utf-8?B?V1Rpd1N1Vm5oZmVGL0ZqNGcxL1FLZzBhbFdhSm1FYnNTRnArRDlGd2Q5cm5s?=
 =?utf-8?B?d1c4UkhEcXFmSXUxYVFWUGRPY3dyNitZSDRNYTZ0TjRNL1VVWXZzUjk3UmMr?=
 =?utf-8?B?WjJDK0JETThocVgyNUFlQmhmZjcycXVzaFJvNFEwYys0SllxNEUwUWV0eWF2?=
 =?utf-8?B?bE92WWVkOFU2YlZOaTloNTdKeGlteVZhZkxVR2NKSW5lWXI5NDN4a2J5Q3Qy?=
 =?utf-8?B?TkNJaUxIMVd6MmRhZUVsTEdDb21tOTVLVnlIYjZEa3J1TlJzMFZuY3g4TDFB?=
 =?utf-8?B?M2NyS2JsQkNlQVorRDFNVXJIVU5PNHFERUpBN2VuSFBtMVZOZC9ycU5BZzQ0?=
 =?utf-8?B?dzJKTk1DMmhFeUpmNzdjNWNsR1pvWE5sZm05R1N5QzQwYmZxaU5ZcWVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d05hMDhzQ0VMSUpadnFCQXVHNnRNdjY4MmhrckdjNXRhVFhIS1FlanJmci8v?=
 =?utf-8?B?V2lTSmUwd09aL0FDWkQ3b2dPTVRRTmpnWHhmdDlzMGVRZzNFcm92NHlXb255?=
 =?utf-8?B?bzdiVGxuN1RnKzU1V1RqL21oQWpBamhrQm5zUXVjYkgrU1VyZFBjUW42RHhR?=
 =?utf-8?B?UHNOdTFBT1ZFRHd2Mjh5VjlKUFdHUTRnV1FnbVRtZHRRRXVjMzgwRHNqTjF5?=
 =?utf-8?B?anh6QjVoZFZhU0ljRkNRRmdzUThIeXZNUHgydUxvUURkRG1oV01SK1FLNE85?=
 =?utf-8?B?QWRLNEpsREp6c0ZEUmViTmpTM1dTQjdLWDVTd1kwQmVHLzBWcVhOUWJBZ05m?=
 =?utf-8?B?dHRiN2JVczZzaFJud243cHNhM2xhYU40eTlpRE1jbDZiMnQ3V09ZaGJDMWl3?=
 =?utf-8?B?MzJIbU94U095VGxXek1EbGZXSGV4NkRHM3FoOENBNnR3L2luUWdVZmhGM2NT?=
 =?utf-8?B?YkpGa2J1OUxVcnFoTW1DSzVFMkx6VG9xUXQraDJuUUZUME9tKzV0a2F4Vm51?=
 =?utf-8?B?WUhYa2VZU3k4eEZvTzNVVkkyTlJSVkFqSnp4bXZMeCtiNGw4MHRSNkM3Mjho?=
 =?utf-8?B?WmFWUlMxaEI2Z24vSVcvWW00WVFUbFg5cmFRTVBZVFp6YTFkc3ovWHd2dVNj?=
 =?utf-8?B?c3ZFZGFjR1cvK2Nva2FoSUh2S3BJTXVFZU9rUzh4cjFIYkU1NlRMQTA4SkI2?=
 =?utf-8?B?akJDWDNOTXlvOGJtNWNBNnpzcWpjZCs4bVNaUjB0QmhiTjFQdXhVbTY4L3ZG?=
 =?utf-8?B?d3NweSt5R0dnUTltZ1I0OUtGZHE4bGxZNE9IL1d1Z2NmdmRaMCs5YlJSSFFl?=
 =?utf-8?B?OEswN3habGlzSEsrdW5XazAvNnJOcUV3RFRwd1pWZmRkMXZjaDRIVW9jSDc3?=
 =?utf-8?B?M0duUjFQVWM2Q0pUNHNsdnFTMlVoM2JuOFArdU45RnlCdy9pQkdPTmNwT1Nr?=
 =?utf-8?B?U2RReWhCdVBaT2hGaGdNZUpkcE5lbTVYUUtLM2s0LzNCNGRUYmxyc3c3YkM0?=
 =?utf-8?B?cCtSUW9zRTh1ZGMvMlVjRmJNaFMwdUtSMFJWaEE0aytNT2E1R2Rhc0gyZldi?=
 =?utf-8?B?UVVvSnpSUmsvWEFwMEs1aE10VkIzczAxa0dOcXBqMWQ3bklLZmtqd1o3Qy90?=
 =?utf-8?B?SjVBQXlLc3hGeFNLdmxadm1jS2NTbXQza3hRNkh3aXJOaS81Mk9MbUtBT0xO?=
 =?utf-8?B?dG9RQjJ6WWxqbGNTMDhhT2wzOWVqcmRQZkRLbWlpRUxMUW5qcmNxRVNkWXBV?=
 =?utf-8?B?ZnN5d2tOMlVoL2lZVC9ieTBubUNXd25QR0J3OHgra0lZcytJUHlkUzBNdmVk?=
 =?utf-8?B?eWJTa0xlaGtlRFZvUWNRYlp6RmZEZ25mdWJQODFqQWRVZGVPUDBlNE9EaUlG?=
 =?utf-8?B?Y3RLNW1laG9iRXF6RkhkUlZBMC9MbWZKTVVheEZhWVRuU1FQNXNVMzcrRS9M?=
 =?utf-8?B?dTNhaEJBTVN3eStsNktBQU1BYXJjZklOWVJkVHVoS3ZVWjREaUNDTjJES2dH?=
 =?utf-8?B?aHJ4dmhaWXlGN1hCSjBsLzVRSC9yQ3ZJck5KdkdyL0k1TjYrbnZWTkwwNXlJ?=
 =?utf-8?B?WXU4cEQ4cloxWlNtblBRWHViR3FRQ3hmQXVLRnFmRXBpNlUyc05NZWJPMEl5?=
 =?utf-8?B?TDZjT1M2NWUyeHppOWNHRDEyM1FldWt1K0Z4aXJGV3VBeHFBNDZETklXV3F1?=
 =?utf-8?B?OHNUd3hSRFMzaGUwQzdkNCtKVWlPdGNLSjdZSFZuSFAvRGQ3UTZMeklKTW5s?=
 =?utf-8?B?b1VqejVLcHR6cHE0WGd6WkZ1bXpRbFA4b1JHdCtHK1haSUE0em9XTHM2aDh0?=
 =?utf-8?B?U1lTc25yaVZlS2l4bk1HSDlOYTBRRG5wd0ROSFdzOEwvMERUaFpsRXZXajZm?=
 =?utf-8?B?QkhPTlRKNElLZHpTSHhIRHNTUWZQcE1tVkdsQ3JFcmhPZTJVa3ZOYTVGVlUv?=
 =?utf-8?B?cm9vMU1Wekg2RTV3QVVUZnZxUHI3ZElyQ3RBdVJzaEVNTm1oOHArRnd6VUdx?=
 =?utf-8?B?S2o3TEVpa293TEJUMHl3RkdHWHNhUXZnL2dpa3c1dGlwaDBSTmZQemlmRUtq?=
 =?utf-8?B?L2RLc3YvenBsWWhOei90MUNDZ1I5cUx0aVltcld1aDZOMmY3RTNsdFJVOXdt?=
 =?utf-8?Q?4weBYvj0NNu1hAOHcMX7/oZVZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	koCpbtQSWMoMsIrpeGyoAe/cFPVJM6lk5BI7r/tg53EImF6MVx34PJ+TKUvw5TdrNyF/wM7+a0SN8sUSZcIUY76nTqVHQd1+JF+VYmS/LW9omRIa+hjFCp3O9PmrlYIPdx8h+Tn+P552igbT01pHXRC5hXGAA1iaVSmBbmx6ZekVfHeO0onW3WHWCodzB6Hqs9Mm6/UVnL07nby01fjxB6iuLci5TvNuGMr2BV70z6/zMfFtCHcNbosKLjbV0nOYXEzZ/PcExwtZ7gW9CShOYmQyQDPXazW4PNcfg4DjaHKWMpfOsf4ls98oNUG4dCY3FIzAKsnsza4+vvjLqVYgNVU8BrRYf3QIrI9tN3NUDTRWq4jCrUhsv+YgrszQF7XBkAcyLC1HNbBLTQDjkW09SowKfhL4NopQO8kpNkKmqFGsB3yZG9uIcwhmhiiJBOP1Cq233Mtz7VBBp3g4Hc8wcimtofSr4+/p/nvliV6l9uHth0ZymioAK514KH918+HxEqpzGVQHleRmAzYHRFbVaVAop3BIj1Ptr53FmElnyo4LXgF7ezBMIxqUtzGUtK/DvK3aRAPDYYMTvmT4UDql0euas8YVWN4RhbHRp7AuY3Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb980c6b-1670-4869-85d4-08dcea47ea93
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 22:56:18.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NI3EhMguIvN+WI44eRM6Lp4pAqb0ibF2fyBb1aieJHKbzx9oJbfjRo3GhXzdE+RG2apx8Ml0JHGqB9gN2/nb+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6021
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_20,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410110160
X-Proofpoint-ORIG-GUID: FfT4GSZHJFqFAj2WgQnwrgHyDuat1L4e
X-Proofpoint-GUID: FfT4GSZHJFqFAj2WgQnwrgHyDuat1L4e

I know there is another review email closely related to this one, but 
here I'll try basically to respond to what's in this email.

Also, you make a number of suggestions that I could incorporate that, 
therefore, warrant no further discussion here.  If I don't comment on 
some particular point, that means I think I managed to incorporate that 
particular feedback.

On 10/10/24 00:55, Kris Van Hees wrote:
> On Wed, Oct 09, 2024 at 01:45:34AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> As USDT processes come and go, the overlying probes for an underlying
>> probe will change.  Hence, we will move to a scheme in which an
>> underlying probe will walk all possible clauses it could call,
>> deciding at run time (using a bit mask for the overlying USDT probe)
>> which of the clauses to call.
> I think this could be explained a bit better.  I'd say that it is the "set of
> overlying probes for an underlying probe" that will change.  And I would add
> that the underlying probe program will walk all possible clauses that any of
> its overlying probes might call for each overlying probe, only executing the
> clauses that apply to that overlying probe (using a bitmask).

I'm not convinced I understand what you're getting at here, but the next 
version of the patch should reflect my best attempt to incorporate your 
suggestions.

>> As USDT processes start up, we also add new overlying USDT probes,
>> whose name elements must be retrieved by prid for the built-in
>> variables probeprov, probemod, probefunc, and probename.  While
>> this is currently done with the BPF "probes" and "strtab" maps,
>> the monolithic strtab map cannot safely be updated by the consumer
>> while the kernel might be reading the map.  Therefore, we introduce
>> a new variable, dtp->dt_ninitprobes, that records the number of
>> initial probes, those created when a dtrace starts up.  For a
>> prid < dtp->ninitprobes, the existing scheme is used to retrieve
>> probe name elements.  For newer prids, necessarily USDT probes,
>> we use new a new BPF "usdt_names" map.
> I think this could do with a bit of rewording for clarity.

I don't know what specifically you had in mind, but the next version of 
the patch should reflect my best understanding of what might have 
concerned you.

> I am also a bit
> wondering about the dt_ninitprobes name.  I think that dt_nprobes would be
> sufficient, as the number of probes that DTrace creates.  Any probes added
> later are numbered higher than dt_nprobes.  Not an ideal name, but I think
> it is sufficient (and pre-tracing is the only time we really care about
> counting probes in general - the later ones are counter towards nusdtprobes).

Okay.  Change made.

>> The underlying-probes "update" function is called sporadically.
>> The focus of this patch is the function.  When it is called can
>> be tuned in future patches.
> This seems to be an old paragraph because the focus of this patch seems to
> be the creation (and mgmt) of the two new maps.  Ideally, this would be
> multiple patches actually (creating the maps, populating the maps, using the
> maps, ...)

Ideally, yes.  The original patch series had finer granularity, but some 
disruption (I think the "enabled PID" change) produced lots of changes, 
which were easier to handle by lumping some patches together.  So, 
"ideally" some refactoring could be done for finer-grained patches for 
easier review, but at this point is the current factoring of the patches 
"good enough"?

>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> @@ -940,6 +940,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>> +static int
>> +gmap_create_usdt(dtrace_hdl_t *dtp)
>> +{
>> +	dtp->dt_usdt_namesmap_fd = create_gmap(dtp, "usdt_names", BPF_MAP_TYPE_HASH,
>> +	    sizeof(dtrace_id_t),
>> +	    DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN,
> Any reason why you are not using DTRACE_FULLNAMELEN?

Honestly, because I didn't know about it.

That said, FULLNAMELEN has the funny characteristic that it has a "+4".  
I wouldn't be surprised if that's a mistake.  Anyhow, it means that 
theoretically using FULLNAMELEN means using a little extra storage.

In practice, the component name lengths are all multiples of 8 bytes, 
the key is only 4 bytes, and the BPF map I think rounds to 8-byte 
alignment.  So, in practice, using FULLNAMELEN does not cost any extra 
space.

So, I converted to FULLNAMELEN.  Here, and one other place.

>> +	if (dtp->dt_usdt_namesmap_fd == -1)
>> +		return -1;
>> +
>> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
>> +	    dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz,
>> +	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);
> empty line perhaps?0~

Sorry, I don't understand this comment.

>> +	if (dtp->dt_usdt_pridsmap_fd == -1)
>> +		return -1;
>> +
>> +	dtp->dt_ninitprobes = dtp->dt_probe_id;
>> +
>> +	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
>> +	if (dt_uprobe.update(dtp, NULL) < 0)
>> +		return -1;
> Yes and no.  You are using the probe name data for USDT probes that already
> exist at this time from the strtab so there is no need to update the usdt_names
> map at this point.  The usdt_prids map does need updating, but I don't think it
> makes sense to do that here.  During program load would seem a much better
> time.

I don't know what specifically you have in mind, but perhaps the real 
discussion is over on the other email.

> Also, we certainly wouldn't want to use a direct call to a function in
> a specific provider.

Yes, that smells stinky, but that can be changed once we have a better 
sense of where we want to go.  One solution is to have the consumer loop 
over all providers, calling the provider-specific update() function for 
any provider that supplies one.  Again, however, maybe this topic makes 
more sense over on your later email.

>> +
>> +	return 0;
>> +}
>> +
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> @@ -63,6 +65,15 @@ typedef struct list_probe {
>> +typedef struct usdt_prids_map_key {
>> +	pid_t		pid;
>> +	dtrace_id_t	uprid;
>> +} usdt_prids_map_key_t;
>> +typedef struct usdt_prids_map_val {
>> +	dtrace_id_t	prid;
>> +	long long	mask;
>> +} usdt_prids_map_val_t;
> Move these to dt_bpf_maps.h?

Okay.  I did this, but this uses types like pid_t and dtrace_id_t. I had 
problems compiling the bpf/*.c files that included dt_bpf_maps.h...  
resolving those typedefs and/or dealing with the header files I tried to 
include to define the typedefs.

Not a big deal;  not a blocker.  I moved these things to dt_bpf_maps.h 
and left pid_t and dtrace_id_t as ints for now.  A FIXME indicates that 
this should ideally be cleaned up.

>> @@ -123,6 +137,213 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>> +/*
>> + * Clean up the BPF "usdt_prids" map.
>> + */
>> +static int
>> +purge_BPFmap(dtrace_hdl_t *dtp)
>> +{
>> +	int			fdprids = dtp->dt_usdt_pridsmap_fd;
>> +	int			fdnames = dtp->dt_usdt_namesmap_fd;
>> +	usdt_prids_map_key_t	key, nxt;
>> +	usdt_prids_map_val_t	val;
>> +
>> +	/* Initialize key to a pid/uprid that cannot be found. */
>> +	key.pid = 0;
>> +	key.uprid = 0;
>> +
>> +	/* Loop over all entries. */
>> +	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
>> +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
>> +
>> +		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
>> +			return dt_set_errno(dtp, EDT_BPF);
>> +
>> +		/* Check if the process is still running. */
>> +		if (!Pexists(key.pid)) {
>> +			dt_bpf_map_delete(fdprids, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
>> +			dt_bpf_map_delete(fdnames, &val.prid);
>> +			continue;
>> +		}
>> +
>> +		/*
>> +		 * FIXME.  There might be another case, where the process
>> +		 * is still running, but some of its USDT probes are gone?
>> +		 * So maybe we have to check for the existence of one of
>> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
>> +		 *     char *prv = ...pdp->prv minus the numerial part;
>> +		 *
>> +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
>> +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
>> +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
>> +		 */
> Yes, there is the case where a dlclose() can cause some of the task's USDT
> probes to be dropped.

Shall this be addressed now, or can it wait until after this patch 
series?  (I vote for waiting.)

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>> @@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>>   	dtrace_workstatus_t	rval;
>>   	int			gen;
>>   
>> +	if (dt_uprobe.update(dtp, NULL) < 0)
>> +		return DTRACE_WORKSTATUS_ERROR;
> We probably should to do this with a callback function

Again, maybe we discuss more on the other email, but I don't get what 
you're suggesting here.

> instead of calling a
> function directly in a specific provider.

Again, it could loop over all providers, simply calling an update 
function for any provider that supplies one.

> Still thinking about a better name
> for the callback though.  Perhaps dt_usdt->rematch() or something like that?
> Or dt_usdt->matchall()?  One of those was used in the original DTrace code
> base as far as I recall.

I guess it depends on how we think of what's going on here and how that 
will generalize.  My thought was that, unless we have some event-driven, 
dtprobed, inotify() saying when the function should be called, we simply 
want to be called "periodically" and that other providers might someday 
want to do the same...  for purposes rather unlike what USDT wants this 
for.  So, that why I chose a name that was very generic, assuming only 
that the function would be called "periodically."
