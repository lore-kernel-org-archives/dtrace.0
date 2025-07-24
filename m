Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8D2EBB81
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753381310; cv=fail; b=tW1oOtci3gjSnc+Yoo1RjikaFZIPfAKJoW+Ar1d/B4HWSVsq6umhFkNfAXc16yCYEBmL+XRm32dc26+HXU2dE7jIiOwFo2q2Wc4DHJnCYARBQSZgQ9R8+CvQboYU7sB4w9pphsgI4aNDfm8JUtGPz7730XyRukX275R+vHCb/+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753381310; c=relaxed/simple;
	bh=iyVjzwY2foAay14PXyR7eXKA8QTGu6jT1M0qVgEkQ0k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VM7kta5h38XQdxbih3c17XmthBla4CuuImbAsK+EEBY+oNsRr1oWWGRANNEX1NV2pDKY5uxWbHH8zq9HF1VTXxZ4ZhRrKlIMHzBvcxxQL6BDw7sMx8Pf4AEtWWSC2cwSnLPBSpO8AcFNhgLZJPNQbITE2gmo8CL+L45cg1Kds5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pENn3AKd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TLtdkIeo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pENn3AKd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TLtdkIeo"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGisAg000470
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iyVjzwY2foAay14PXyR7eXKA8QTGu6jT1M0qVgEkQ0k=; b=
	pENn3AKdXJpR/dt9DmHsqhhxVWi8JhC3lTfpZOg553Po/1oQuyeLQ2Ck5xLptDS9
	WDDyjoM7HWCgeKjB6tV5wos8KI7BykCb5R5mHsMsn03tbKNH6/LQrL2nmvw/F/oe
	ur824QcxFShkEbisyFFvADUUvVIO6eXDqg7jUZh3WDimiWApSC/1+SBEH8qIVr3s
	YzPPSP9Fg0JJ4yXrJDx2g6xktvmSElIz04oD6LZQA17HOU7J8zk8dPP3ysuWc/zY
	xStWu9uNL0SDTGapgfAQRL9Hzz7nF4EYsdh2S7meVE6jf8hk+Ns3zga911BHtHIB
	/2iFbqGPYW/2Uhn+YHO/Bw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e2j5d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:21:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OHOZoX011509
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:21:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc55yr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 18:21:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1+/gKLqdpnEl4WrdMGEyImVvVhxfObd2+cxDIYUylvD8+yN1qv+P293tm1xxQ3WwP7/3O7VJYmVYmzLYEyblRA3QJlQswrIOJpSVaOoVFO6hH68Zla0RHkO7sKwIVL2JUuPB/wrujnEir1pC40AHqH3Cnkkbl6ZyJ/ctR2Awi4wdEHgJ4EGKczXQZz6gMAN770n5HX5wb2ardvR8F8Ua3j8SZfpjMJE3eHuH5FSnzbv6BYjq8RINtgWkb2MPTHX6LKbkmJrjm7CfeAmpj4TFubFBnyNFTsP1GrLsoTUixZfGnSq8igygco1dVNi2pzASRUQ4EH4sbT4leFI1lOQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyVjzwY2foAay14PXyR7eXKA8QTGu6jT1M0qVgEkQ0k=;
 b=P4demgEbjc7a89BTP6FAHGlUQ/BVGesanTFF97SzchrV1zpEXVBXDixIq0p4+SaUW6cRHcOqVs9RVMLjeEFevstF0zyyHChA06iUDQcHmFuNpFtLbiYD4fbTO9BLnJiY7//ed7hujf58YsCpMbfwe0SuvDuebZJpzK3oqnG6wIDTo7hJkWtlbC1EfNtDWiTpDnDmLcvvE5yFqsnkn8RhtsxIceq7OrmxkmKDJLtAlnW8n7Mq0PIn5AQREaAJCYNwHvtok1BO1Ts+daQnQTSMaiA1pOUYFBKr3smyTei0ZkNwJ9AzBu++R6ljWaEgPQ/wqz7Ipfiv8xUQLehkPMSOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyVjzwY2foAay14PXyR7eXKA8QTGu6jT1M0qVgEkQ0k=;
 b=TLtdkIeoj6cgeLmT5DlUbo+969Mv44seps+RXcVRddYPPu7CzegYse82rPN79LGu/mo0HRfJTgtTupgfwXle92o0wvhhs3FobreDJrEm3xIj9QaAMOKeew13ndFFvuGPwTQ99syjZwMVdfX3gWNIYNlMz5sEq7V8Yqg1NChMUsk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8640.namprd10.prod.outlook.com (2603:10b6:208:583::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 18:21:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 18:21:38 +0000
Message-ID: <a7197497-1d4a-f68b-f62e-5819e94515f3@oracle.com>
Date: Thu, 24 Jul 2025 14:21:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Test that PASSes but should not
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
References: <aIJsb0P4H6S+tO0k@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIJsb0P4H6S+tO0k@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH1PEPF00013317.namprd07.prod.outlook.com
 (2603:10b6:518:1::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: acd03d2d-778a-4e21-7194-08ddcadeee13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTZHSDRnNHFoOXNFUW1BMGZhRXBTYmpNU3hMTURBS1VzdVhhR2wxZHFWcjhj?=
 =?utf-8?B?Z1kwTjFMUndGam5mdWZXR0VyNFF5SmpLdDVSa3hkYVMwN3EzZGwzUDRyWXNH?=
 =?utf-8?B?UGozR2tTNlEzakFsQ0JMdlVVU0g1em5LUWdoalRWUzlNYnk1cXltN05Ja0RD?=
 =?utf-8?B?WXZVb0lNMGNGd1pROGs5YkRlcEZBek1ZWlZKRzVxc20xQW5XRC94ei9VM1Y2?=
 =?utf-8?B?YURGT3pLeVp1WVdjOEJKa1BFaXR3c1R2Sm1tdGdWTnpPMUVBZnhZTTRLMmNR?=
 =?utf-8?B?QVV1NEVRTU5jK2JiUXRTVDVtNHJZemRaR3pWN1BMSG5IWExsenN0ZnBrMmxq?=
 =?utf-8?B?T05DTzdiR1JZS095NCtMUkNZbEl2S0dLYTJKR210Tit0SG1GWlZ6Y2N4Y1VM?=
 =?utf-8?B?dlU5SlVPdmNiYkhTVXBFMnFVckFKY1dvVEY1ZE8ySmpNWk1IdGtrb21pMng0?=
 =?utf-8?B?ZFlreUVOMXVCVHNYdkFzTTJhQVFRSktydFZUOXdoUFh2ZTFtN1NmcGxCZzRB?=
 =?utf-8?B?NXN4N0F5amV4YWRXUk1HWkE0UytNdjlIMU5tYThDUytkT2VMaHJ2empSMVFl?=
 =?utf-8?B?OGcrK0VROVZVdzFEYldrMXl3TWhXcnZRb21nTS95aVRMUUtwc0FwbTMrTHBV?=
 =?utf-8?B?dHN6dWk3OElxYjA2ZTgxVWpEb1JoOGtJOW1jUVdVbEhMYXB0WC9FVWhuZUpI?=
 =?utf-8?B?cUpyMkxMMGk5bGpJODZwbnYvU1BJdWxCMDFwbkV3YXFUVDdlQ3RkRzR6a1NY?=
 =?utf-8?B?UEVhSUxwVXFOeWEzK2txWDZhYTVWQWdvSkY4K0wrNVVvdll4NDhLNTVVMkNM?=
 =?utf-8?B?WlhWSmFFdmJ6M052aVljbGJVYlBhVEtkQktGTVVxR3VNdkp3U2ZUYVpzVC9w?=
 =?utf-8?B?WitjZVNoTUtVSTVPU0J1YjE4VW9rVlU3b05PUzVrODU4TzdxVzk0NGFQYlN3?=
 =?utf-8?B?bmZ1eEZRTGU4UVN2MTZ1emQxQTlIQWRsNFhONmJtc2hSK2dkQUdMTTZDRVIx?=
 =?utf-8?B?WW9qUG1OSFlYUTRXSnFRSmVJRmwzdmcyU0gycmk2TmtodmdkOUZiYk5vV0ZI?=
 =?utf-8?B?UTQxVVJpekZyek9qVm8rT1JnWlpQM2ZscjVOOTNPMlpmbmE2MmdPZnQvQ1o1?=
 =?utf-8?B?NEFuUTVueTJUQklScEh6Z3J2L2ljcUl4TnBsdkNRRUNkT0tmMnkvd0xqOGsy?=
 =?utf-8?B?NStIQWsvZGRic2JkNWVWcDc0YVcwNi92K25tRU9Cd2Q2a3I0VklseUtyT2NM?=
 =?utf-8?B?SVFDMVNGVnBsYnFwMWZMaGQwSGU0TGU5SUVFRDNrbDRzTzRBS3EzQkpSQ1dI?=
 =?utf-8?B?UHdhOWYzTU51eStjSHZwNjMxYmRWdkJrRTB2bTdnSlpqeWwzUnFwS2tYbita?=
 =?utf-8?B?ZGlUUWMxWElEZVdYQ21MZ2MveUxSejJzcVdFbnBwd2lFNjUrWDBBYm80TFln?=
 =?utf-8?B?WGZQaW9uTXYvRG10Z0tVOWh0dG9UNm5uNWNiRE9LWG1PRnArZ0ZIQmlFWE9H?=
 =?utf-8?B?OFdHLzJGenFJa2RyTkk0a21Rb3F4UFpSQ2QvRzRvLzJ4SlRZV2UyVUs1N3Bo?=
 =?utf-8?B?UG5YYXptZjdtREZWMk9CaGcraFVMaXh6VW5UOHRKWUloTlRxL2NEdzN3VS94?=
 =?utf-8?B?KzcwMkFjTjlQcHV3V3RIVkltdGxKTENSR0tYQVAzRWwyUXJPUGhiRUxpSTd4?=
 =?utf-8?B?b0NNcEtqVG5UbGswLzh0RzhpQSs1QXE5V1VLOThtWE5meWdlcjN4YlZIeGRR?=
 =?utf-8?B?b3dOY1FpZ0VRcEJXaFYvUGFhaExSV2xDemJOaFYwVU12WFlyVXl1K3Y2THJt?=
 =?utf-8?B?RnE2NUsyTUV3djFlN3YvcUhnc2hYSkVMYm1obEtaUkkzbHJ5QzFuRHNuV2ZQ?=
 =?utf-8?B?dFlVL1ZIakFNMHMxYjdLd0RaYVZlVEpRUDVUd21LMUJWNVdJNTJNb2VxMHFM?=
 =?utf-8?Q?in0OJiLcIP8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEFRNHhYTEp2ZEtBTnMxWW1IODFYU0thMVk3S082OEhWUmV3TWtDbWppajd2?=
 =?utf-8?B?SWlDVm9LVkFNdEhXSXVLbnA0MllEemNjWjRZQXAyUExaOVhHUzlQRnVSVkdp?=
 =?utf-8?B?TlZ1eitOY0FtQ2pmTlJFNXB0ZTd4enUyRTllMzYyVklqeUZpRkF4RWVqUWxy?=
 =?utf-8?B?VTBQQjBBeHpKaHFoTlBFQWJpVEhOOFBHQ0liYU0xTlR1VUlmcmZwV0FmdEpn?=
 =?utf-8?B?emMzTGtqQVlnSHB3RXJOWGZ6T0tFdGY5SllQdVhVRWdEanFzU1Y5VnhLMmN0?=
 =?utf-8?B?MDdLWk05SW1UOFZ6REdKbmgvU1VsQ1dxY3NLWmhsY3hyVkxuL3V6cExhaWdu?=
 =?utf-8?B?ckwydW1SWWRtMDlBWGg0RFMrNkQwYnZhRGt5cVR2NkE0SUhRcUhmTE5pRnp3?=
 =?utf-8?B?Mml3Mm5PcjhuN3o4eUcydlR1ZGdUSkVvYVg4cnF4NC9HMWZORE5WZWxZMEdr?=
 =?utf-8?B?UTdzQ3NXeVpHakVGQlJIL1RBUlIrWE5UUW9RN3BlWk9WU050R3R5Q0lpZGZY?=
 =?utf-8?B?V0x0N3U1enF4Njl1UWJnKy9EWHhDTEhBVXE3dnpsN2pEMXdocDlrYWY3aUR0?=
 =?utf-8?B?a0x2SmhDZTV4b21PdlB4ZmloaGluc292RmZFTjh0Sm02QllJUWRvNU1XR1pQ?=
 =?utf-8?B?dzR4OVJ3U255NjI1bHJjbDZpaGNpV0tETG9jeU0rcHNWYi90QmI4Tzc2VFhp?=
 =?utf-8?B?VWtXUGRRQ0hkV2pwVCs2OHU3MnJScVF2RGtNakFVbXplSFUxVm4xeEM3dCtz?=
 =?utf-8?B?dC9lV3lpY21jL0JVZVlINVFQQmdhZTJ6VThWOWt4N2VqK1lvcllzVXlYWjNl?=
 =?utf-8?B?ZXMwdCsvT2pmV3h0Z3IzV2x4NkN1NVduZFd1czRlWXJrV0NGQmtSYm4za3RG?=
 =?utf-8?B?V3QwZGhnMnA3M2tHSFltTHFHNUN0TTFPbDdvVnc4SGpPZGNvMVQ3QTFBK1VZ?=
 =?utf-8?B?dlplV0E4ejd3RXliSndoODJJSEdnMnA1dTFLWWZLYWRQcnEyc2treGx2VVlo?=
 =?utf-8?B?RGwyU3RSbFhqLy9yS3JzWFpWM2hZazdBQzUycURRaCtyTnVpa1JRMUo2QnVD?=
 =?utf-8?B?cWMwVVU1MldrTS9YdVJlVE9JRGhFTS9BSVpuVStkRDFqcllkL0o5a0hmTyt0?=
 =?utf-8?B?Wk5vN1E2QlllMnVLVTJYcGxrejJnaUQ4a3FkOGphZUFla1FJbTRhZlEyZldx?=
 =?utf-8?B?Zlg0RXhrYmZhSFBKcEt3YWMrK3o4dmxRV1U4djZlM3IwV09La3AxQTZ4cVBU?=
 =?utf-8?B?TzhPeUhUSHkwZG1CSStkelJLeDJRZ2h0STVEQlVpMHY1ZnNUSWVMSXZmWFdk?=
 =?utf-8?B?aVkraVhNaCtOam5ZbmpqS1QwcDhyNDc3bDlwc2dGVEZYd0JFN2pKT21QMWRy?=
 =?utf-8?B?bVJ1MlZtSUxMVWkrcXpnTjZ1VUt6QXNLRmhWSCtFR0c3RTh0NlZOTkg1NDZL?=
 =?utf-8?B?a0taZFFTcWJwQkEvQVhsRjBEelVPeHB4aWpaWG42THJ2TEhQM3NkNXVjWk9U?=
 =?utf-8?B?NGl2Ris1aXpuZzVZUU1ZKzlWbkIxL1BYVUgvc0FIR2FBMlVabi9Memg3R1Iy?=
 =?utf-8?B?VnVMdmJ2SkpqdSt4M0YyQ09SaXNrVDE0cnhmMG0yWVRIT0Y5OTI0V0NNbzFN?=
 =?utf-8?B?UXA1eXlqRFFWczlhSnUyMEV5ZzJVSXlsL0hwSXFYbEwrSkxONlNpWU9PVjlh?=
 =?utf-8?B?b0FRZExEUXRUZUp0c3c1RjFreTRDTXZNblNydVQxZHNIQlVwSUZycXlBaW8w?=
 =?utf-8?B?cDkrYXFySTF0NFNIRjByNExFazNhY2lKME9qRSsrd0hwVHlnREdJeHZKOEJY?=
 =?utf-8?B?emFOV0NCRC9zQnp5anNxcFFwWXdIaTVEV1JCTkNCRkJVVkJOS05hRDRCaXUz?=
 =?utf-8?B?SDRuQTkyN1VZTitzNFhIMWFOY2pxOUFKdHJxS2pCRVBSNVZWaWNCQmZVaFIx?=
 =?utf-8?B?RHhHOVgxdFh6NnB5OTNSNC9NODVIWEhzUWZhMEd1UlowNUNKNGo0UWNxYjQ1?=
 =?utf-8?B?U1FCcWpYbUU2enBSckpqZlFDUnN6azl4Z1BrNzEvRzVMNjZPVFVneDRRdjRK?=
 =?utf-8?B?MktLNVFRbjFmWEtnOGJHN1VZa0VZd3R0aTFRUFU5cmV3QndGK2J6THJFbWNR?=
 =?utf-8?Q?EAVKJeUZMUh9KS2xVDoZykmnQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lAFKPJCq55SS/M6s+9vnNTUjvA4Vp6w2iVuIbYfRrpQ7n3pXhpt4Td9IZoZPSqT89LX0uQJWX9zLNlxBLKu1oCDr9tTtvKUBNclLysWaQX76+AYRWUjgS1Sl/xvRTuf/vi7QIQTGvhk8VUKxN5vy8+iIdXoVSG3YAR7tA9NdBN/bjCGGn1/3ay412DPfWZpY8dhZDIhB0PH01SdLs78maOBTz/v14se8xmzP8JNa36TWLw2JZyHEnqb1osc82Auh4GcoX25CIhEv45N0vJXJS/uVj+PvtKa5kXTk47BURDT3Q1BUEu3RChhYyGs8qt2XxoL3lNKxL8IOJYq80FwpQVDyXhwXV5kDA2CZc4dggUiCyj2Jt+6jNi8iJCq70aczhrZkqDJr0L0jHIGT+k0LErGDrpA1PfB7da/TElSKJrt63WRWOoKF4Y1oC05aGdn8xzWl/vdMDPF57/EoYff61JkQJVZSuv8Z5FbBpUbSotLF9kpgQsBCrghpdKUQWh4FFwVx1xUR6EfZee7e6gmelp0knpBgVsLFIrLglMj2Aj4jcJ/JJ66xfYotSwTSpFqtbR3IDREC2PspCkkA85DUnNu3H6Klp8W5wfpJabmOi3Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd03d2d-778a-4e21-7194-08ddcadeee13
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 18:21:38.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqB3G6AI52zTTc14ClKJtadPzvTATQJuy8/jDkAlOH0sqA7j3ckQfIQEKnZvX0PoD27tlE+YI6Ky2u2leW2yDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8640
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240141
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=688279bb b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=lJrB4sSKjtvEOPKnC0MA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: jPi5drI2J7lmOmd7nm_rkxQOtyDuCHRK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDE0MSBTYWx0ZWRfX+Di627z9Hbfb
 j4kvAwKowdT5NN9lXOx7dj/WynjGkYRDE4+RJ+0pxlRwwjYQwR9Rhc12ewNLhz4EUQVSuWVaEf+
 wmdx0w5M5LR8/x269ZiKfoYoA+7fMCpalrTCBw9aLJOMdLgWdyHdFKReqUHwM+axKEPwh5SmRA9
 +2/JXZ2nI4A6k+DwHeCtEs1n3DHH6W7i1wClB7ORBjSQLV+pluQ/MWI6hHPr7Fd+dT+5Qf/NSeU
 EMA5kVajUwM6jj8AQ1l9CjVwlX0dzK8+sQQcvWhMfBVIopBsvQY60nXETrKjYiHxiWQSW4PxGaz
 eXukUUhY1bcLhssRHIFI7TMZBxnAY2WR0Y5BiwDl48iVJRCPwcJJszhnWkBSR8jnIqs3lyJcToJ
 Lzl947JrE4qQLI3Z1KndUD5y+NZ7kvtMmRIwa4marzndvebsvhJDjf3JtpkFbFYlKEcYWD/6
X-Proofpoint-ORIG-GUID: jPi5drI2J7lmOmd7nm_rkxQOtyDuCHRK

And yet it has a .r file?

On 7/24/25 13:25, Kris Van Hees wrote:
> This is not a good thing:
>
> test/unittest/ip/tst.ipv4localicmp.sh: Running timeout --signal=TERM 41 test/unittest/ip/tst.ipv4localicmp.sh /home/kvanhees/dtrace-bpf-user/build/dtrace
> PASS.
> -- @@stderr --
> BPF: func#0 @0
> BPF: func#1 @154
> BPF: func#2 @1121
> BPF: func#3 @1136
> BPF: func#4 @1350
> BPF: func#5 @1355
> BPF: func#6 @1438
> BPF: func#7 @1453
> BPF: func#8 @1667
> BPF: func#9 @1706
> BPF: func#10 @1746
> BPF: func#11 @1926
> BPF: func#12 @1995
> BPF: func#13 @2064
> BPF: func#14 @2074
> BPF: Tracing programs must provide btf_id
> BPF: verification time 33 usec
> BPF: stack depth 0+0+0+0+0+0+0+0+0+0+0+0+0+0+0
> BPF: processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
> dtrace: could not enable tracing: BPF program load for 'fbt:ipv6:ip6_finish_output:entry' failed: Invalid argument
>
> That failure definitely should cause the test to fail.
>
