Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADBE25CC63
	for <dtrace@lists.linux.dev>; Wed,  7 Jan 2026 19:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813545; cv=fail; b=D14O1P8fJWmyqemM40jrqcdBFAAe30rJdMAxthPFgPzEaumNKpJoub1sr5R6bzQdCRxwPqwcO3lAiKhAzsFvqfwKqYVGUhvyzvdUxqQbX0jefDaaRR9u2qo935PQ3IV7z5LzHf/rG/0DL6LNbuPOvy3qYxMK3/QwvLpRtuQpav4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813545; c=relaxed/simple;
	bh=42+JIMzY3WxS1gDPWHTSwWF9DJFrmzEgucamtZEVH3Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s3HdCdmZItdvJLFtafHkzijQvMj+Rd2NYlaalC2lXYgxH6a/iPyszxU+/tpRmyGyVTj9g5nUE1BEKDR3XKLcYynlpRlTs528BU1+qSAU4O1xKtQnQFLkEApwT73EcRCa84A3DM8shmLAGw/EhxRRoNd7NqvfGHoh/+RiB69terA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WWVM191e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hT5MhLkI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WWVM191e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hT5MhLkI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607IpaY52330362
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 19:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=O4SjtFOiNxj4d5szWuGoS+gkeSwAPVvh+J3GhTpGeRI=; b=
	WWVM191eSEzvNn4coHRvAqneeZP74x6/fFwizg6r5qz8aj387whdE+tdHkXnysTO
	u0kI4Xk7QLGl0ljFLxEsWt83NhUwRUqtZsJdGgq2T9xDQ1WgRWdA0nkBVbz+HGwd
	9JpPWIoWkr4nTxsUs+sjFiT0b//wmo9nNJmFABrhNlDmvKPtp4wiJyra+kHuq5OD
	ABZafAumHrMRcZD9H++ZuhRPF4CJEq5X5ah1Pa+yz3P+oor1CRwJGkGqwVERSqMs
	4SNwaXLRB1jTkpifFQOTLFXXtEn4HtXCqxlwauShU0sZUiK89slr+7vLyEZ7fMdu
	xJ+BybgAmPMkng+ZgCtXtg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhw4r81bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 19:19:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607I52oL021658
	for <dtrace@lists.linux.dev>; Wed, 7 Jan 2026 19:19:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besja75vh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Jan 2026 19:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dwtEsjcAmbbvf0sLKy90gzAfCTW/PAbiUl1A6TfLcNSfbL/UVxls1FcR7cPBOJ8PoTMOqUR+0D4HHm5w1kJAibRbNuolyDRPLOB3xl08yhKkDttgJn78jr05uH1UBlvXnEHwBqFEMQ8TcIrImeAvkqyO9ojkRv4VEfNuVMeaCuNHLkn13GEreZU8CeLczpd0Z2lLTUgdBWLrK1S6Brl7BhBXAICSZj3b0V6vR7dgqQl+29BdzOLdWFF3ocJ6t3PVFadvpa8oHH+aX6m9eFCo4zT0ivbrpaAWIe2MVmzWOz+OhGsGsG7PztlaouyjvX0eqtPILRBOrxlH0jZTH/3MMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4SjtFOiNxj4d5szWuGoS+gkeSwAPVvh+J3GhTpGeRI=;
 b=EtSjENlQ0UtHpJokBqYjcHcx9TKuXGUcrJ1j7r2cqc2ia1cjP6zj/eYUv687a3s1i8ohoMFaQ8Y49RofTUO0EQSf4eumxDNKNozgi8XlxHOHFK+e4QxIKQAuPlrAylvFopaKONXakVOtkL9SzH0il6KwZYDnWfDnNBYQkof2ESi7WYna/ge5PmKaHRFPucbdzqvyg+CAziu2ByqO0F1kWeWKnzk8gZ1bhA9X0GV9xT6VKXIezVtWOrnRRm/3cU19HCt+Fvux1vb2dOQW+QRr5VR4sFL22xp8Uhtbh7zhL7nb3SLoP10ow2n9h8kcS0CPtmnHPDbGqkDkXJn4pZru/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4SjtFOiNxj4d5szWuGoS+gkeSwAPVvh+J3GhTpGeRI=;
 b=hT5MhLkIkGKgf9BnX31j77cqde4FW8u8UEmFv/wkoT5nY4kvi4iokxx/wVzUklX0wbO73yqwrQ9/tX76Ce7jhyXTprFkc8uAzSS6B5COV6VagNlFS8s17nzcAg5VVlHqh/N3KWV5PM+ekopwhMvzKyB6hWlAgfXQb0p9r9W6/Rw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4498.namprd10.prod.outlook.com (2603:10b6:303:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 19:18:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 19:18:58 +0000
Message-ID: <b8d159e9-63d2-ff01-c965-b2a247c78cac@oracle.com>
Date: Wed, 7 Jan 2026 14:18:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] bpf: allocate the buffers BPF map to fit highest
 CPU id
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522FFA1904E3A7555E4BE15C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <db11ae09-92a4-26cb-d8ec-aaef1b5574cc@oracle.com>
 <aV5rcv/s8A2eLJXi@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aV5rcv/s8A2eLJXi@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4498:EE_
X-MS-Office365-Filtering-Correlation-Id: 776ae99a-1542-41e3-661c-08de4e219b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1RhZzNqRXE3TURuV2JEaWdxN1dnSUVEQlAxMUl5Qm1BK3lLZjlYNmJzRlho?=
 =?utf-8?B?dEdnMjFhNmhhL2xLM2VHZnh1WStNQThMOUt5KzFndjlGYlYxdGt2emUxWWJx?=
 =?utf-8?B?azhqMVlFUDAvamRGbVN3a2hjUUlxUTJod1h5R3YrVE9Gd3lya0x6K3VGd0hn?=
 =?utf-8?B?bEcxU255dGNaY3ZyMkFpQzVDSnYyMjZZQ1V0WmJkSVVXelkyZGlxUDErSi8v?=
 =?utf-8?B?aVdVc1BzaklLZm1hTFp5M2dhT1V0ek8wbFNocDkxeHJaUStkSTdOTkZ3OFd3?=
 =?utf-8?B?UGtXWFJLYnh5bGVzK3d0Z3ViMWZGRjQ1aGlTR3I2ZUUrRHJqQ0FOUmFYMUNC?=
 =?utf-8?B?TVpzcmZXbFI5SThsWXRoUjlMYmhaNFV2T3QrbGlrbTRRdXBlL2daNFVEbjc0?=
 =?utf-8?B?ZHhtQ1hQU2JiRTB3dXFxY3JFTEphRU5BV2x1Qyt3WXVYcE9aSUJsa2oxRGVq?=
 =?utf-8?B?eGx6T05Ta1pEQ011VHl5eWp5MHZOaUdJaDJOYmRkUmRkcjdxSVhpQkxmcEd2?=
 =?utf-8?B?VGJaQVZmczh0cnFmeCtuTWFoS3hnQUpjdnZKZjNkZldLR1piZkUrRnpIa25K?=
 =?utf-8?B?MlYrbXhkb0NJQStsS0wxQkxhNWVFYW5SeWU5QnhtSlhGWkU0ZmlLMk1kV1pL?=
 =?utf-8?B?am9DcEJ3R0h6U0R3SmFSTDdxdDczTzRsOXp5S0IzUjk5MkpsYkRYcEdmeGVh?=
 =?utf-8?B?M0poQUYvUVlsSVZhYTZlQ0QxSTluV0FqNzVYbnRIUGE0Ry82ajJqZUxWL2pV?=
 =?utf-8?B?WWZ6QnZRRnVwWlY3amNDcVg0L1MxdHFlczZoNzdSRHE0UU53VFIrTjJGRGg3?=
 =?utf-8?B?UW9RK0VOekFoeFo3SlBEc3J0ekN5WHJ4bW9zR1lIWFQrK3BTeW5DSklUdU9L?=
 =?utf-8?B?a0h3YklWck55eVordjd6U01FdW9kczRnZjRCbW9GZDJpT21EK282YU94Rjg5?=
 =?utf-8?B?d0JQVnJVUi9EMXhNdlp0THZaMGVCcXJLVWo2bVdsREhlaEFNUmpmcXB2bXZw?=
 =?utf-8?B?NFBXT0hQMURFaTc5VW1CM3V1Tkc0VE5mbklMamI5ZU9qYk5ScC9VWG1pMjlM?=
 =?utf-8?B?bnVuaVRJdkFka1ZaL1Azdk5sSmErZC9GS0JUc3psVndpd3FnNVpjZUVTbUZL?=
 =?utf-8?B?NHZYdm52ZFBjTFZJSHNRWjIrckZna25OOElEQmFmRUIvbWN1RHBIaU85Mk45?=
 =?utf-8?B?ajMrRWs2VXpZWTdNd3o1amNUVXN1NkZER2hvaEdoRWV1Z1ZmVGZxdEV0ZzBr?=
 =?utf-8?B?azdOYlkrQ3hKcUpoeFR2cnF3ZWRmTmFha3k3OTlZSTNTN2RDWmlMbUhzS1k5?=
 =?utf-8?B?NEtyaHZTVnZHeFladWpnNE1Yc0luS2JkcnNLR0s1YnpMWDFnT3hoR3MrODQy?=
 =?utf-8?B?TEpodUJoc0I4ajdxVDU1RE5kL3UyVDNoOHk1NVlodkpOTk1UY1krYXpPRTBW?=
 =?utf-8?B?UHl1Rm42NDk2dVM5ZGQvdUFEUFB4eEtNc2E4Q2VTdW9SVzNDRXVrbGpKN1dG?=
 =?utf-8?B?K0N3b2d4R0pydVU5dVNDSHZiZlpJYXd1V2FDcWx2cHpnN2twa2hVSTh6SmxU?=
 =?utf-8?B?NnA3R1RGVFNSOVEvQzBkSmRWeEcwZXFXWE1Xc3NKSzYveWVQVjR3WmNQWUwz?=
 =?utf-8?B?RWd2WndBL1o4NWVBaTFTNkZxZm1hcFJEYW1SMUg2SGtnNFNOSzVjcFgrZi9C?=
 =?utf-8?B?NjBKVkg1VUVaeGVLKy9yK1lVODBFNDF2K0ZEdTNFN3E1YW51b0ZZa05RNzBk?=
 =?utf-8?B?TEhpOG5YbEVKb21ieHprN1BvamMrSnFtcnZOcncvQ1dlZDlHZ04xWGhKaVQy?=
 =?utf-8?B?UlNZanMyS2xaclNNd2pWd21jTTFTWXQxcDBsZVJRbVdSK1g1bmdtVENzN0Zs?=
 =?utf-8?B?MTVpOGFyeEI0NnRzMXliVHpOaEY0ckdxMlh6QkpMWDN4SFlYZ21kNHV1bXdE?=
 =?utf-8?Q?h8qtkIfibbPmsnRRagGKW51R3l6Vng+D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHpMamsvUUI4RzR1dGZqaFl5TS9tUXRuUUhOTnVSRUV6TW1QZXo5UTdjVng3?=
 =?utf-8?B?eUFBVnV5dURLVGRoTG05WkRHN0pseW5KaDZEMG5iZ2x6aWp4VHV1T3NCaUty?=
 =?utf-8?B?b3doZUNWL1ZHZ2VidjdPakNDZjBKd0ZtRE14Ni8zT09GNVc3bVN0VGpmZHNm?=
 =?utf-8?B?ZmtuZ3VVeG5UTnBjVVdHWm50SzlVM3hMWFpUM2NMU3NMMXF2OTdaZVRGZGp5?=
 =?utf-8?B?eE1ZRTFFRUNwaGVjSUlqTHg5TmlnNXdLWnF2eEc4azd6Y3FRSW93RFRlNE8z?=
 =?utf-8?B?cktTL0ZUYmxEUGs3NTd2RU55L3c0bTJnWkR4cDllKzk1V0szdC9IWGMwV01y?=
 =?utf-8?B?YmZGMzBiMlZGV1huWk51bzJOTlFqdUNpbUluK05VclpqdG52cWlGcGFyeTJW?=
 =?utf-8?B?R0dKV2JxQkdBa0dvK1hwckIxSnROcmNBNlFKTGVOUEM2Um1LR0t0eERZTHNC?=
 =?utf-8?B?a0VBZlh1V1locW5FNFBPcFRvZGNSUGVsQ0tFOERzU2ROa0NwaUtQazJGN3VI?=
 =?utf-8?B?MTU1T2Q5ZzdNMzlMcHdPWXlIeUd0Ym1RRk8yQUVWVHlwYStlelZKb3l5UTBo?=
 =?utf-8?B?OWdRL2hXdW80SytmU3B0d20zcVlOMXh2b1p5a09XdU1jUmp6RXl1VzFBNmsz?=
 =?utf-8?B?NC9BOXhNeHFPUkk1cnN5YlVRWXA0T0U5WG5YZkM2elRxZGd2WGFVZFcrVE9T?=
 =?utf-8?B?cVNEZWlwRHNRQSszbUJ3RjNsQ1RxZGJrZmFOd1VEOTdHSjVwdDB3NjZndWh5?=
 =?utf-8?B?aXRYR3o3eWxwZytlZG5SQVFIeFpDaFJYRnQ0YTJ1azNZaUhxUWErQnJuUnV3?=
 =?utf-8?B?T1ZHcWJJWFkzMENNMldhQ2VlUmlndXBhVTBYU2plakpiOHd1dGlYakxQMVIx?=
 =?utf-8?B?dTZmejRIdHNtSDhPL05scnJKcnZUS2hUd0VkNFRKRE1Ld0J0T2FIYkVWNkgx?=
 =?utf-8?B?TE52ajBBeE50TDRJa0RXZWlnNXZQd2tSYnpmT2VIZmtZUkNkcWloeXFldXpz?=
 =?utf-8?B?NjFNNStDNmY1b2w5N0R2U2pLMVpybGo5bkdRU083aCt3UDY3Uk1DS1c3N1ZQ?=
 =?utf-8?B?S01vYk9kaGdYTnJyTTRxT3NPZGgwL1BLRGJWcy80VDQzWU5zSkhpZjlHN3FD?=
 =?utf-8?B?ZERxYm9jNjQ4R2ZEblpRVVYrc1hiMXRXc2pvVExHRFpwM0F4a3I1WHpDL01t?=
 =?utf-8?B?YzNpWVdHQzM1TXRYTXI4dGk4VW80cnIzWFRpSVN1aWdaMVNaNE5tZWpXVldX?=
 =?utf-8?B?dDBYc2ZZRCt0eGJKZGp3REhPVWx5QUdRcUVWRlNpd2NyZzgveTgzL3hlUEt6?=
 =?utf-8?B?SDFQMUk0bWYvMzIvMWVLRFdIWWxLQy9wcEh0NzB0Y3NlMUNCNGkybWNCZWkz?=
 =?utf-8?B?eGZ5OEtTNFdEdG1md3Z5MjlqSjZQNHRRbmdpeWxCVVZmWmpJWjIwd1cyM202?=
 =?utf-8?B?Ukp5SS9oQTZPN0Vnd0d0Q0hlU3lXQjFyMlI2WmtzcllQMTAvWWVZWVBCK2xZ?=
 =?utf-8?B?UkdZSWx4SW9obGlJUDV1YytVemJzNVJ4YVhkbzFpQlVHSGhENittWkE3SVVT?=
 =?utf-8?B?SVQ5MElyVitva01nQXBsWmw0eTRWaytLOUVycUE5YVdOSUgrd3NUMVJmeFFn?=
 =?utf-8?B?anR5K1dVc0c3dURKeVJyRkV1ZEdoYjFDdFBiZnJzT21kVjcxbnBqTUMwOFFo?=
 =?utf-8?B?U3BvZzJVS1V6RVhLdmlRWWU2d2V3RHZMdk03WHJrQWovd21uR211ZG9PVW4z?=
 =?utf-8?B?UnBMbWRyT2hZaXFBRndjaGE5WFdQYllRWjY2V2k0d2J4ZWM2c0ZwTVJUWUpj?=
 =?utf-8?B?NjRYdVZKMEt4akZZQzk3SU50dXlBdTVJRERGT3FPV3BKcmoyWXFSaVA5L2xO?=
 =?utf-8?B?ek9VQTZNTGliVXhFVXBXejRWRkg0c3BSYVNidkRIcTEzWG4xY1IzUHR1ZTNN?=
 =?utf-8?B?cUsraDg3TEtMQVYrOW44TTNRZTZKOWRCMExhd3V2MUhsdDEvL2JHcUprcG5o?=
 =?utf-8?B?Zm42MmN5d3NtZzkyeGxXdlY5ZlFFQU5uYjFEVllsREU1ZW9qL3p4VXZDcTFy?=
 =?utf-8?B?ZlNuZVNzZjhtcTNDN2RiZktIRkJYaGpvM0J0bnFtMXFTUkZwVWRKUElYOFB1?=
 =?utf-8?B?MVZUQ05keGtKRjJIb1MxVU11WmMvVzRjTXc0V1JaWGQyaHJZQi9mZG0rNC9r?=
 =?utf-8?B?MTMvTitFUGcxY3VyMFJnM2hMalJ1dDk1YW5YNFBXaXI4bk5VckNPaUxYRmVU?=
 =?utf-8?B?NHlOam5yZHlMQ3ZQdzQ4Nko5a1dOei9CNzVBblQxUHdSTFVXQk93WFhWelpr?=
 =?utf-8?B?U01jREtCWDhYMU05TDh6TlVjdTJnL0lqWFFJeWNsUTd4UTMvd0FpQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RTlqSWn0kR7/GsxcLpn62Vp0oa+S5E6+ofkRQgoGlMBCZqz+sGJB60pQlLtv4aePIGsZUCTQtEdnyb3WPvaLo5Oea0m7gfZt2rKlJZGxrkMO+/38YlTBfn7fMEzhCE/b3vulchjID8+xP8aCfkyHYGUTWpMuuol3Ca70GF8eBN47xPemN7SxkTBgrhW+FJYIA/Hyi2mNkM64zphu+TiW7NV6WgNNa5fXp+fB46BGC1FNA3+C7J9/+UaUg7tTQGwAw767RI1AEQQBc5lVHV5GUeywSYDBrxxxJ3bnb2xpvyIhn0cdnSxvIDc+BSyT4u9Hw0Vdruuvv23yLPTCxBOR5RBQWq/MIr3gWJLZpELkTIYix+Sezm1ix79x9Hys3psheHy3PlSS61paabmabtc8yAOq5I2v3hLSA2LiSSan86LWsu8wsgK7+GyXx+2x5uwWkB/6vrN5Zx36WVEuYQUT2Edb81BFcFDXvAW2rTDhJSSx9Zcpg3/JtFG+nmteXcHGG1re/3EwYXQ4SmDvU8jTNzHA8bs937vcJFjTMZ9/0d/jFlVBBketRrin87V6BCEVwmNm+n7CpVshmjoZ+1GTbfIZn3bxyWHpjk9GIuyQ9QI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776ae99a-1542-41e3-661c-08de4e219b7d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 19:18:58.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QUAK5tooF8PsUTgRQrr9iY1PSP8VQXxLUqzz/4UjnIuYyJU4n6RZOfjdGoZ1a6P8WquWMZtsnVuigYQy1w/r/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601070153
X-Proofpoint-GUID: O5m3AM-rqS7S9DvRqN21-crt29MGUw5v
X-Proofpoint-ORIG-GUID: O5m3AM-rqS7S9DvRqN21-crt29MGUw5v
X-Authority-Analysis: v=2.4 cv=GuFPO01C c=1 sm=1 tr=0 ts=695eb1a6 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=4apWLzXAYQy0hm40dWIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE1MyBTYWx0ZWRfX5Y1IfHtpoQzX
 TKWc+52yaGLPRF0KzNaQgvkhHr38Q/TRh6yXGGIwjxxgtqEoNtX5gXzAfoUUAcmxR4MWPnMsY7D
 6A/5oi/Fa1nQ2zt+/qZK+deQHiuAeeoTNWeEtmQ8vCWLWLgHc2FBvpQwAmfyocSf7fe+g4p7K9p
 759LF0P2L/Qf9gm4mCakCzzdj8YaPV8qF+AedZFNoM/u5hoCQujWVWJlRD2PvrQlbp0JApXjhjW
 q9MapQl+4deITwcWafvwNGSb2+gbbB5BSWAfMq8b5N+K/c43UvQFIp82EQr4dD0MNAjR1Z4Wyoo
 0ZTYlYIHhDGZ+TGdYxRa9UJzVN3Yn8pmAm58o3HBXd6p4zr1SBM4VZrPlP+0KIHDXpAjMRWNLMx
 uUqa1FYxywZiBIwIvnjWmjPBiVJJ++ZDiVLkWg03E4BRVjLC8iKwqbOzKiL98P3KXr3wdmTHonB
 7vrR/nPuF3YJGGCBPCw==

On 1/7/26 09:19, Kris Van Hees wrote:

> On Thu, Dec 18, 2025 at 03:10:32PM -0500, Eugene Loh wrote:
>>   Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> Per your reporting on the 2/4 patch, and further testing, the array map needs
> to be created with size max_cpuid + 1 to accomodate the CPU with the highest
> id (max_cpuid).  I made that change in the patch and it resolves the issues
> with tests.
>
> If you agree, I can just make that change in the patch, retain your R-b, and
> merge.  Let me know...

Yes, I agree.

>> On 12/17/25 00:10, Kris Van Hees wrote:
>>> Even when less than the possible number of CPUs are online, the 'buffers'
>>> BPF map should be allocated based on the highest possible CPU id because
>>> probe data is written to the bufer that corresponds to a given CPU id,
>>> which could be part of non-sequential CPU id configurations.
>>>
>>> The observed problem was on a system with 128 possible CPUs (0-127), but
>>> only CPUs 0-7,100-107 were online.  The 'buffers' BPF map was created with
>>> space to hold 16 trace data buffers (one for each online CPU), and since it
>>> is an array map, this caused the trace buffers for CPUs 100-107 to fail to
>>> allocate buffers, which in turn caused any trace data generated for those
>>> CPUs never to get reported.  Since 'buffers' is an array map accessed by
>>> CPU id, enough space must be allocated to accomodate the highest online
>>> CPU id.
>>>
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_bpf.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>>> index 0a57b7d2..6568a572 100644
>>> --- a/libdtrace/dt_bpf.c
>>> +++ b/libdtrace/dt_bpf.c
>>> @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>>>    {
>>>    	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
>>>    			   sizeof(uint32_t), sizeof(uint32_t),
>>> -			   dtp->dt_conf.num_online_cpus);
>>> +			   dtp->dt_conf.max_cpuid);
>>>    }
>>>    /*
